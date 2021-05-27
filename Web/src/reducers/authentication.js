import {TOKEN, PHYSICIAN_DETAILS} from '../actions/types';

const initialState = {
  token: '',
  physcianDetails:''
};

const authenticationReducer = (state = initialState, action) => {
  switch (action.type) {
    case TOKEN:
      return {
        ...state,
        token: action.payload,
      };
      case PHYSICIAN_DETAILS:
      return {
        ...state,
        physcianDetails: action.payload,
      };
    default:
      return state;
  }
};

export default authenticationReducer;
