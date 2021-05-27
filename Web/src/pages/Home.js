import React from 'react';
import { makeStyles } from "@material-ui/core/styles";
import Button from "@material-ui/core/Button";
import Box from "@material-ui/core/Box";
import * as actions from '../actions/actions';
import { connect } from 'react-redux';

import {
    BrowserRouter as Router,
    useHistory
} from "react-router-dom";


function Home(props) {
    const classes = useStyles();
    const history = useHistory();

    function onClickPhysicianButton(){
        props.getPhysicians(props);
     };

     function onClickBillingButton(){
        props.getBillingDetails(props);
     };

     function onClickPatientButton(){
        props.getPatientDetails(props);
     };

    return (
        <Router>
            <div>
                <Box
                    component="div"
                    m={1}
                    className={`${classes.centerBox} ${classes.box}`}
                >
                    <label>
                        Clinical Application
  </label>
                </Box>
                <Box
                    component="div"
                    m={1}
                    className={`${classes.centerBox} ${classes.box}`}
                >
                    <Button variant="contained" color="primary" style={{ height: 40, width: 400 }} onClick={() => onClickPhysicianButton()}>
                    Physician Visit Module
      </Button>
                </Box>
                <Box
                    component="div"
                    m={1}
                    className={`${classes.centerBox} ${classes.box}`}
                >
                    <Button variant="contained" color="primary" style={{ height: 40, width: 400  }} onClick={() => onClickPatientButton()}>
                        Patient Visit Module
      </Button>
                </Box>
                <Box
                    component="div"
                    m={1}
                    className={`${classes.centerBox} ${classes.box}`}
                >
                    <Button variant="contained" color="primary" style={{ height: 40, width: 400  }} onClick={() => onClickBillingButton()}>
                        Billing Module
      </Button>
                </Box>
            </div>
        </Router>

    );
}

const useStyles = makeStyles((theme) => ({
    box: {
        height: 100,
        display: "flex",
        padding: 8
    },
    centerBox: {
        justifyContent: "center",
        alignItems: "center"
    },
}));

const mapStateToProps = state => {
    const token = state.authentication.token;
    const physcianDetails = state.authentication.physcianDetails;
    return {
        token,
        physcianDetails
    };
};

export default connect(mapStateToProps, actions)(Home);
