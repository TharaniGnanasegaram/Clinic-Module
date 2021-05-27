import React from 'react';
import Modal from '@material-ui/core/Modal';

export default function ModalView(props) {
  return (
        <Modal
        open={props.open}
        onClose={props.onClose}
        aria-labelledby="simple-modal-title"
        aria-describedby="simple-modal-description"
      >
        {props.body}
      </Modal>
  );
}