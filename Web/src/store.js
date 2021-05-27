import authentication from './reducers/authentication';
import {createStore, combineReducers, applyMiddleware} from 'redux';
import thunk from 'redux-thunk';

const rootReducer = combineReducers({
  authentication: authentication,
});

export default function configureStore() {
  const store = createStore(rootReducer, {}, applyMiddleware(thunk));
  return store;
}