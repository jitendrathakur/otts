<?php
class AdvertisesController extends AppController
{


    /**
     * This action method is used to display paginated list of Advertises.
     *
     * @return void
     */
    public function admin_index()
    {
        $this->Advertise->recursive = 0;
                
        $this->set('Advertises', $this->paginate());        
    }//end index()

    
    /**
     * This action method is used to add new Advertise.
     *
     * @return void
     */
    public function admin_add()
    {
        if ($this->request->is('post')) {
            $this->Advertise->create();
            if ($this->Advertise->save($this->request->data)) {
                $this->Advertise->Image->Behaviors->attach(
                    'ImageUpload',
                    array(
                        'fileField' => 'filename',
                        'dirFormat' => 'images'
                    )
                );
                $this->request->data['Image'] = array_merge(
                    $this->request->data['Image'],
                    array('advertise_id' => $this->Advertise->id)
                );                
                if ($this->Advertise->Image->save($this->request->data)) {

                    $this->Session->setFlash(
                        __('The Advertise has been saved'),
                        'success'                    
                    );
                } else {
                    $this->Advertise->delete();
                    $this->Session->setFlash(__('The Advertise image could not be saved. Please, try again.'), 'error');
                }
                
                $this->redirect(array('action' => 'index'));
            } else {
                $this->Session->setFlash(__('The Advertise could not be saved. Please, try again.'), 'error');
            }
        }        
      
    }//end add()


    /**
     * This action method is used to edit the selected Advertise.
     *
     * @param integer $id Advertise id
     *
     * @return void
     */
    public function admin_edit($id = null)
    {
        $this->Advertise->id = $id;

        // If Advertise does not exist, throws an exception.
        if (!$this->Advertise->exists()) {
            throw new NotFoundException(__('Invalid Advertise'));
        }

        // If form was submitted, saves the Advertise.
        if ($this->request->is('post') || $this->request->is('put')) {            
            
            if ($this->Advertise->save($this->request->data)) {
                $this->Advertise->Image->Behaviors->attach(
                    'ImageUpload',
                    array(
                        'fileField' => 'filename',
                        'dirFormat' => 'images'
                    )
                );
                $this->request->data['Image'] = array_merge(
                    $this->request->data['Image'],
                    array('Advertise_id' => $this->Advertise->id)
                );                
                if ($this->Advertise->Image->save($this->request->data)) {

                    $this->Session->setFlash(
                        __('The Advertise has been saved'),
                        'success'                    
                    );
                } else {
                    $this->Advertise->delete();
                    $this->Session->setFlash(__('The Advertise image could not be saved. Please, try again.'), 'error');
                }
                
                $this->redirect(array('action' => 'index'));
            } else {
                $this->Session->setFlash(__('The Advertise could not be saved. Please, try again.'), 'error');
            }
        } else {
            $this->request->data = $this->Advertise->read(null, $id);
            $this->request->data['Advertise']['answer'] = unserialize($this->request->data['Advertise']['answer']);
        }

        $subjects = $this->Advertise->Subject->find(
            'all',
            array(
                //'fields' => array('id', 'name'),
                'contain' => array(
                    'Course' => array(
                        'fields' => array('name'),
                        'Board' => array(
                            'fields' => array('name'),
                            'order' => 'Board.name',
                        )
                    )
                ),
               // 'group' => 'Course.name',                
            )
        );       
        
        $subjectList = array();
        foreach ($subjects as $subject){
            $subjectList[$subject['Course']['Board']['name'].' : '.$subject['Course']['name']][$subject['Subject']['id']] = $subject['Subject']['name'];
        } 

        $subjects = $subjectList;
        $images      = $this->Advertise->Image->find(
            'all', 
            array(
             'conditions' => array('Image.Advertise_id' => $id),
             'contain' => false
            )
        );        

        $Advertise_id = $id;
        $this->set(compact('subjects', 'Advertise_id', 'images'));
    }//end edit()


    /**
     * This action method is used to delete the selected Advertise.
     *
     * @param integer $id Advertise id
     *
     * @return void
     */
    public function admin_delete($id = null)
    {
        // If this action method was not called by POST method, throws an exception.
        if (!$this->request->is('post')) {
            throw new MethodNotAllowedException();
        }
        $this->Advertise->id = $id;

        // If the Advertise does not exists, throws an exception.
        if (!$this->Advertise->exists()) {
            throw new NotFoundException(__('Invalid Advertise'));
        }

        // Deletes the Advertise.
        if ($this->Advertise->delete()) {
            $this->Session->setFlash(__('Advertise deleted'), 'success');
            $this->redirect(array('action' => 'index'));
        }

        // If the Advertise was not deleted, sets flash message.
        $this->Session->setFlash(__('Advertise was not deleted'));
        $this->redirect(array('action' => 'index'));
    }//end delete()


    public function admin_edit_Advertise_image($id = null) {        
        $this->Advertise->id = $id;
        // If the Advertise does not exists, throws an exception.
        if (!$this->Advertise->exists()) {
            throw new NotFoundException(__('Invalid Advertise'));
        }
        //debug($this->request->data);exit;
        $this->Advertise->Image->Behaviors->attach(
            'ImageUpload',
            array(
                'fileField' => 'filename',
                'dirFormat' => 'images'
            )
        );
        //debug($this->request->data);exit;
        if ($this->Advertise->Image->save($this->request->data)) {
            $this->Session->setFlash(__('Image Saved'), 'success');
        } else {
            //debug($this->Advertise->Image->validationErrors);            
            $this->Session->setFlash('Image could not be saved.', 'error');
        }
        $this->redirect($this->referer());
    }


}//end class
