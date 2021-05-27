import {TOKEN, PHYSICIAN_DETAILS} from './types';
import axios from 'axios';
import Constants from '../config/Constants';
import {reactLocalStorage} from 'reactjs-localstorage';

export const setToken = data => {
  console.log('isDropDownSelected', data);
  return {
    type: TOKEN,
    payload: data,
  };
};


export const getPhysicians = (props) => {
  return dispatch => {
    axios({
      method: 'GET',
      url: Constants.urls.BASEURL + 'api/physician',
    })
      .then(async function (response) {
        console.log("getPhysicians response", response);
        reactLocalStorage.setObject('Physician', response.data);
        await dispatch({type: PHYSICIAN_DETAILS, payload: response})
        props.history.push("/Physician")

      }).catch(function (error) {
        console.log("getPhysicians error", error.response);

      })
      .finally(function () {
        // always executed
      });
  };

}

export const addPhysicians = (props, data) => {

  return dispatch => {
    axios({
      method: 'POST',
      url: Constants.urls.BASEURL + 'api/physician',
      data: data
    })
      .then(async function (response) {
        await dispatch(getPhysicians(props));
        alert("Record succefully added...!");
      }).catch(function (error) {
        alert(error.response.data.message);
      })
      .finally(function () {
        // always executed
      });
  };

}

export const getBillingDetails = (props) => {
  return dispatch => {
    axios({
      method: 'GET',
      url: Constants.urls.BASEURL + 'api/billing',
    })
      .then(async function (response) {
        console.log("getBillingDetails response", response);
        reactLocalStorage.setObject('Billing', response.data);
        props.history.push("/BillingScreen")

      }).catch(function (error) {
        console.log("getBillingDetails error", error.response);

      })
      .finally(function () {
        // always executed
      });
  };

}


export const getPatientDetails = (props) => {
  return dispatch => {
    axios({
      method: 'GET',
      url: Constants.urls.BASEURL + 'api/visit',
    })
      .then(async function (response) {
        console.log("getPatientDetails response", response);
        reactLocalStorage.setObject('Patient', response.data);
        props.history.push("/PatientVisit")

      }).catch(function (error) {
        console.log("getPatientDetails error", error.response);

      })
      .finally(function () {
        // always executed
      });
  };

}