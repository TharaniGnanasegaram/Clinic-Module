import React from 'react';
import { Switch, Route } from 'react-router-dom';

import Home from './pages/Home';
import PhysicianScreen from './pages/PhysicianScreen';
import PatientVisitScreen from './pages/PatientVisitScreen';
import BillingScreen from './pages/BillingScreen';

const Main = () => {
  return (
    <Switch> {/* The Switch decides which component to show based on the current URL.*/}
      <Route exact path='/' component={Home}></Route>
      <Route exact path='/Physician' component={PhysicianScreen}></Route>
      <Route exact path='/PatientVisit' component={PatientVisitScreen}></Route>
      <Route exact path='/BillingScreen' component={BillingScreen}></Route>
    </Switch>
  );
}

export default Main;