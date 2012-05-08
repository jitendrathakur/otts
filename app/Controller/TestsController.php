<?php

class TestsController extends AppController
{


    /**
     * This class variable is used to list models used by this controller class.
     *
     * @var array
     */
    public $uses = array(
                    'Test',
                    'Question',
                    'Subject',
                   );


    /**
     * This action method is used to display paginated list of tests.
     *
     * @return void
     */
    public function index()
    {
        $this->paginate = array(
                           'contain' => array(
                                         'Candidate.name',
                                         'Candidate.id',
                                        ),
                           'order'   => array('Test.id' => 'desc'),
                          );
        $tests          = $this->paginate();

        // Adds score in each test.
        foreach ($tests as &$test) {
            $test['Test']['score'] = $this->Test->getTestScore($test['Test']['id']);
        }
        unset($test);

        $this->set(compact('tests'));
    }//end index()


    /**
     * This action method is used to display details of selected test.
     *
     * @param integer $id test id
     *
     * @return void
     */
    public function view($id = null)
    {
        $this->Test->id = $id;

        // If test does not exists, throws na exception.
        if (!$this->Test->exists()) {
            throw new NotFoundException(__('Invalid test'));
        }

        // Get
        $test = $this->Test->find(
            'first',
            array(
             'conditions' => array('Test.id' => $id),
             'contain'    => array(
                              'Candidate.id',
                              'Candidate.name',
                              'TestQuestion',
                             ),
            )
        );

        $score = $this->Test->getTestScore($id);

        $this->set(compact('test', 'score'));
    }//end view()


    /**
     * This action method is used to add new test.
     *
     * @return void
     */
    public function add()
    {
        // If the form was submitted, proceeds to save the form.
        if ($this->request->is('post')) {

            // Gets random questions
            $questions = $this->Question->find(
                'all',
                array(
                 'contain'    => array('Subject'),
                 'conditions' => array('Question.subject_id' => $this->request->data['Test']['subject_id']),
                 'order'      => 'RAND()',
                 'limit'      => 25,
                )
            );

            // Modifies data to be saved as associated models.
            $modifiedRequestData = $this->Test->modifyTestData($this->request->data, $questions);

            // Saves associated data.
            $this->Test->create();
            if ($this->Test->saveAssociated($modifiedRequestData)) {
                $this->Session->setFlash(
                    __('The test has been saved'),
                    'default',
                    array('class' => 'success')
                );
                $this->redirect(array('action' => 'index'));
            } else {
                $this->Session->setFlash(__('The test could not be saved. Please, try again.'));
            }
        }

        $candidates = $this->Test->Candidate->find('list');
        $subjects   = $this->Subject->find('list');

        $this->set(compact('candidates', 'subjects'));
    }//end add()


    /**
     * This action method is used to delete the selected test.
     *
     * @param integer $id test id
     *
     * @return void
     */
    public function delete($id = null)
    {
        // If this action method was not called with POST method, throws exception.
        if (!$this->request->is('post')) {
            throw new MethodNotAllowedException();
        }

        // If the test does not exist, throws an exception.
        $this->Test->id = $id;
        if (!$this->Test->exists()) {
            throw new NotFoundException(__('Invalid test'));
        }

        // TODO: don't delete if the test is already taken.
        if ($this->Test->delete()) {
            $this->Session->setFlash(__('Test deleted'), 'default', array('class' => 'success'));
            $this->redirect(array('action' => 'index'));
        }

        // If the test was not deleted, sets flash message and redirects.
        $this->Session->setFlash(__('Test was not deleted'));
        $this->redirect(array('action' => 'index'));
    }//end delete()


    /**
     * This action method is used to review submitted test questions.
     *
     * @param integer $testId Test id
     * @param integer $index  index of question from set of test question
     *
     * @return void
     */
    public function review($testId=null, $index=1)
    {
        // if test id do not exists throw error message.
        if (!$testId) {
            $this->Session->setFlash('Invalid Test.');
            $this->redirect(array('action' => 'index'));
        }

        // submits data and redirects to itelf with index no.
        if ($this->request->is('post')) {
            $index = $this->__getUpdatedIndex();
            $this->redirect(array('action' => 'review', $testId, $index));
        }

        // Get question to display.
        $question = $this->__getQuestion($testId, $index);

        // Display question.
        $this->set(compact('question'));

        // This removes preselected option from next/previous question.
        //$this->request->data = null;
    }//end review()


    /**
     * This action method is used to display automatically updated review of live test.
     *
     * @param integer $testId test id
     * @param integer $index  index of the question from set of test question
     *
     * @return void
     */
    public function auto_review($testId=null, $index=null)
    {
        // if test id do not exists throw error message.
        $testId = ($testId) ? $testId : $this->Session->read('Test.id');

        if (!$testId) {
            $this->Session->setFlash('Invalid Test.');
            $this->redirect(array('action' => 'index'));
        } else {
            $this->Session->write('Test.id', $testId);
        }

        // If index was not supplied, get last saved question, else shows first question.
        if (!$index) {
            $test = $this->Test->find(
                'first',
                array(
                 'contain'    => array(),
                 'fields'     => array('Test.last_question'),
                 'conditions' => array('Test.id' => $testId),
                )
            );

            if (isset($test['Test']['last_question'])) {
                $index = $test['Test']['last_question'];
            } else {
                $this->Session->setFlash('Test has not started yet.');
                $index = 25;
            }
            $this->redirect(array('action' => 'auto_review', $testId, $index));
        }

        // Get question to display.
        $question = $this->__getQuestion($testId, $index);

        // Display question.
        $this->set(compact('question'));

    }//end auto_review()


    /**
     * This action method is used to get last question of the test.
     *
     * @return json
     */
    public function get_last_question()
    {
        // FIXME: handle errors in case Test.id is not set in session
        $testId                 = $this->Session->read('Test.id');
        $lastQuestion['testId'] = $testId;
        $savedLastQuestion      = $this->Test->find(
            'first',
            array(
             'contain'    => array(),
             'fields'     => array('Test.last_question'),
             'conditions' => array('Test.id' => $testId),
            )
        );

        if (isset($savedLastQuestion['Test']['last_question'])) {
            $lastQuestion['lastQuestion'] =  $savedLastQuestion['Test']['last_question'];
        }

        $this->autoLayout = false;
        $this->set(compact('lastQuestion'));
    }//end get_last_question()


    /**
     * This action method is used to display test questions.
     *
     * @return void
     */
    public function take_test()
    {
        $index = null;
        if ($this->request->is('post')) {

            // should get id on pressing next prev or submit button
            if (isset($this->request->data['TestQuestion']['test_id'])) {
                $testId = $this->request->data['TestQuestion']['test_id'];
            } else {
                $testId = $this->__validateTestWithCode();
            }

            // if test id do not exists throw error message.
            if (!$testId) {
                $this->Session->setFlash('Method not allowed');
                $this->redirect(array('action' => 'take_test'));
            } else {
                $this->Session->write('Test.id', $testId);
            }

            // Save the question submitted
            $this->__saveQuestion($testId);

            $index = $this->__getUpdatedIndex();
        }

        if ($index) {
            $this->redirect(array('action' => 'question', $index));
        }
    }//end take_test()


    /**
     * This private method is used to update index depending upon button pressed by user.
     *
     * @return integer
     */
    private function __getUpdatedIndex()
    {
        $index = null;
        if (isset($this->request->data['Test']['index']) && isset($this->request->data['btnPrevNext'])) {
            $index   = $this->request->data['Test']['index'];//debug($index);
            $btnName = $this->request->data['btnPrevNext'];
            // FIXME: no of questions are hardcoded here.
            if ($btnName == 'Previous' && $index > 1) {
                $index--;
            } else if ($btnName == 'Next' && $index < 25) {
                $index++;
            }

        } else {
            $index = 1;
        }

        return $index;
    }//end __getUpdatedIndex()


    /**
     * This action method is used to display test questions.
     *
     * @param integer $index index of question in set of test questions
     *
     * @return void
     */
    public function question($index=1)
    {
        // if test id do not exists throw error message.
        $testId = $this->Session->read('Test.id');

        // Get question to display.
        $prevNext = isset($this->request->data['btnPrevNext']) ? $this->request->data['btnPrevNext'] : null;
        $question = $this->__getQuestion($testId, $index, $prevNext);

        // if remaining time is over, saves the test
        $timeRemaining = $this->__getRemainingTime($testId);

        // If time is over, directly show score.
        if (!$timeRemaining) {
            $this->Session->setFlash('Time is over or test has already been submitted.');
            $this->redirect(array('controller' => 'tests', 'action' => 'view_score', $testId));
        }

        $this->set(compact('question', 'timeRemaining'));

        // This removes preselected option from next/previous question.
        $this->request->data = null;
    }//end question()


    /**
     * This private method is used to save question when previous, next or submit button is pressed.
     *
     * @param type $testId test id
     *
     * @return void
     */
    private function __saveQuestion($testId)
    {
        if (isset($this->request->data['btnPrevNext'])
            OR isset($this->request->data['btnSubmitTest'])
        ) {
            $this->Test->TestQuestion->save($this->request->data);
            $this->Test->save(
                array(
                 'id'            => $testId,
                 'last_question' => $this->request->data['Test']['index'],
                )
            );
        }

        // Redirects to view score page if test was submitted.
        if (isset($this->request->data['btnSubmitTest'])) {
            $this->Session->setFlash(
                'The test has been submitted.',
                'default',
                array('class' => 'success')
            );
            $this->redirect(array('action' => 'view_score', $testId));
        }
    }//end __saveQuestion()


    /**
     * This private method vaildates submitted test code and returns test id if exists.
     *
     * @return integer
     */
    private function __validateTestWithCode()
    {
        $testId = null;

        if (isset($this->request->data['Test']['code'])) {
            // Checks if code exists
            $test = $this->Test->find(
                'first',
                array(
                 'recursive'  => -1,
                 'fields'     => array(
                                  'Test.id',
                                  'Test.started',
                                 ),
                 'conditions' => array('Test.code' => $this->request->data['Test']['code']),
                )
            );

            // If no test found for the given code or test is already submitted, sets error message
            if ($test) {
                $testId = $test['Test']['id'];
                if (!isset($test['Test']['started'])) {
                    $this->Test->save(array('id' => $testId, 'Test.started' => date('Y-m-d H:i:s')));
                }
            } else {
                $this->Session->setFlash('Test code is invalid.');
                $this->redirect(array('action' => 'take_test'));
            }
        }

        return $testId;
    }//end __validateTestWithCode()


    /**
     * This private method is used to get next or previous question.
     *
     * @param integer $testId test id submitted with form
     * @param integer $index  question index to display from set of test questions
     *
     * @return boolean
     */
    private function __getQuestion($testId, $index)
    {
        $questions = $this->Test->find(
            'first',
            array(
             'fields'     => array('Test.id'),
             'contain'    => array('TestQuestion' => array('order' => array('TestQuestion.id' => 'asc'))),
             'conditions' => array('Test.id' => $testId),
            )
        );

        $response          = $questions['TestQuestion'][$index-1];
        $response['index'] = $index;

        if ($index <= 1) {
            $response['prev']   = false;
            $response['next']   = true;
            $response['submit'] = false;
        } else if ($index >= (int)(count($questions['TestQuestion']))) {
            $response['prev']   = true;
            $response['next']   = false;
            $response['submit'] = true;
        } else {
            $response['prev']   = true;
            $response['next']   = true;
            $response['submit'] = false;
        }

        return $response;
    }//end __getQuestion()


    /**
     * This private method checks remaining time for test and if it is over, form is saved automatically.
     *
     * @param integer $testId Test id
     *
     * @return integer
     */
    private function __getRemainingTime($testId)
    {
        $test = $this->Test->find(
            'first',
            array(
             'fields'     => array('Test.started'),
             'recursive'  => -1,
             'conditions' => array('Test.id' => $testId),
            )
        );

        // If the test was not started yet, saves start time.
        if (!isset($test['Test']['started'])) {
            $startDateTime = date('Y-m-d H:i:s');
            $this->Test->save(array('id' => $testId, 'started' => $startDateTime));
        } else {
            $startDateTime = $test['Test']['started'];
        }

        $endDateTime   = date('Y-m-d H:i:s', strtotime($startDateTime))." +8 minutes";
        $timeRemaining = strtotime($endDateTime) >= strtotime(date('Y-m-d H:i:s'));
        if ($timeRemaining) {
            $timeDiff = strtotime($endDateTime) - strtotime(date('Y-m-d H:i:s'));
            return $timeDiff;
        } else {
            return null;
        }
    }//end __getRemainingTime()


    /**
     * This action method is used to display test score.
     *
     * @param integer $id test id
     *
     * @return void
     */
    public function view_score($id=null)
    {
        $this->set('score', $this->Test->getTestScore($id));
    }//end view_score()


}//end class
