import React from 'react';
import Table from "@material-ui/core/Table";
import TableBody from "@material-ui/core/TableBody";
import TableCell from "@material-ui/core/TableCell";
import TableContainer from "@material-ui/core/TableContainer";
import TableHead from "@material-ui/core/TableHead";
import TableRow from "@material-ui/core/TableRow";
import Paper from "@material-ui/core/Paper";
import * as actions from '../actions/actions';
import { connect } from 'react-redux';
import AppBar from '@material-ui/core/AppBar';
import Toolbar from '@material-ui/core/Toolbar';
import Typography from '@material-ui/core/Typography';
import InputBase from '@material-ui/core/InputBase';
import { fade, makeStyles } from '@material-ui/core/styles';
import SearchIcon from '@material-ui/icons/Search';
import Button from '@material-ui/core/Button';
import Box from "@material-ui/core/Box";
import Input from '@material-ui/core/Input';
import {
  BrowserRouter as Router,
} from "react-router-dom";
import AlertDialog from '../components/AlertDialog';
import ModalView from '../components/ModalView';
import { reactLocalStorage } from 'reactjs-localstorage';

function PatientVisitScreen(props) {
  const classes = useStyles();
  const [modalStyle] = React.useState(getModalStyle);
  const [openAddAlert, setOpen] = React.useState(false);
  const [openAlert, setOpenAlert] = React.useState(false);
  const [name, setName] = React.useState('')
  const [mobile, setMobile] = React.useState('')
  let data = reactLocalStorage.getObject('Patient');

  function handleAdd() {
    handleClose()
    console.log("handleAdd", data);
  };


  const handleOpen = () => {
    setOpen(true);
  };

  const handleClose = () => {
    setOpen(false);
  };

  const handleOpenAlert = () => {
    setOpenAlert(true);
  };

  const handleCloseAlert = () => {
    setOpenAlert(false);
  };
  const body = (
    <div style={modalStyle} className={classes.paper}>
      <form className={classes.modalRoot} noValidate autoComplete="off">
        <Input style={{ height: 60 }} placeholder="Name" inputProps={{ 'aria-label': 'description' }} onChange={(e) => setName(e.target.value)} />
        <Input style={{ height: 60 }} placeholder="Mobile number" inputProps={{ 'aria-label': 'description' }} onChange={(e) => setMobile(e.target.value)} />
        <Button style={{ height: 40 }} className={classes.buttonStyle} variant="contained" color="primary" onClick={handleAdd}>
          Add
                </Button>
      </form>
    </div>
  );
  return (
    <Router>
      <AppBar position="static">
        <Toolbar>
          <Typography className={classes.title} variant="h6" noWrap>
            Patient
          </Typography>
          <div className={classes.search}>
            <div className={classes.searchIcon}>
              <SearchIcon />
            </div>
            <InputBase
              placeholder="Mobile Number..."
              classes={{
                root: classes.inputRoot,
                input: classes.inputInput,
              }}
              inputProps={{ 'aria-label': 'search' }}
              onChange={(tezt) => onchange(tezt)}
            />
          </div>
        </Toolbar>
      </AppBar>
      <Box
        component="div"
        m={1}
        className={`${classes.RightAlignedBox} ${classes.box}`}
      >
        <Button variant="contained" color="primary" style={{ height: 40, width: 400 }} onClick={handleOpen}>
          ADD +
      </Button>
      </Box>
      <TableContainer component={Paper}>
        <Table className={classes.table} aria-label="simple table">
          <TableHead>
            <TableRow>
              <TableCell>Patient Name</TableCell>
              <TableCell align="center">Physician Name</TableCell>
              <TableCell align="center">Reason</TableCell>
              <TableCell align="center">Visited Time</TableCell>
            </TableRow>
          </TableHead>
          <TableBody>
            {data.map((row) => (
              <TableRow key={row.name}>
                <TableCell component="th" scope="row">
                  {row.patientId}
                </TableCell> {/*TODO*/}
                <TableCell align="center">{row.physicianId}</TableCell>{/*TODO*/}
                <TableCell align="center">{row.reason}</TableCell>
                <TableCell align="center">{row.visitdatetime}</TableCell>
                <TableCell align="center">
                  <Button className={classes.buttonStyle} variant="contained" color="primary">
                    Edit
                </Button>
                </TableCell>
                <TableCell align="left">
                  <Button className={classes.buttonStyle} variant="contained" color="secondary" onClick={handleOpenAlert}>
                    Delete
                  </Button>
                </TableCell>
              </TableRow>
            ))}
          </TableBody>
        </Table>
      </TableContainer>

      <ModalView open={openAddAlert} onClose={handleClose} body={body} />
      <AlertDialog open={openAlert} onClose={handleCloseAlert} handleClose={handleCloseAlert} handleOpen={handleOpenAlert} />
    </Router>
  );


}

function rand() {
  return Math.round(Math.random() * 20) - 10;
}

function getModalStyle() {
  const top = 50 + rand();
  const left = 50 + rand();

  return {
    top: `${top}%`,
    left: `${left}%`,
    transform: `translate(-${top}%, -${left}%)`,
  };
}

const onchange = (props) => {
  console.log("onchange", props);
};

const useStyles = makeStyles((theme) => ({
  table: {
    minWidth: 650,
    margin: 50,
  },
  buttonStyle: {
    padding: 4
  },
  root: {
    flexGrow: 1,
  },
  menuButton: {
    marginRight: theme.spacing(2),
  },
  title: {
    flexGrow: 1,
    display: 'none',
    [theme.breakpoints.up('sm')]: {
      display: 'block',
    },
  },
  search: {
    position: 'relative',
    borderRadius: theme.shape.borderRadius,
    backgroundColor: fade(theme.palette.common.white, 0.15),
    '&:hover': {
      backgroundColor: fade(theme.palette.common.white, 0.25),
    },
    marginLeft: 0,
    width: '100%',
    [theme.breakpoints.up('sm')]: {
      marginLeft: theme.spacing(1),
      width: 'auto',
    },
  },
  searchIcon: {
    padding: theme.spacing(0, 2),
    height: '100%',
    position: 'absolute',
    pointerEvents: 'none',
    display: 'flex',
    alignItems: 'center',
    justifyContent: 'center',
  },
  inputRoot: {
    color: 'inherit',
  },
  inputInput: {
    padding: theme.spacing(1, 1, 1, 0),
    // vertical padding + font size from searchIcon
    paddingLeft: `calc(1em + ${theme.spacing(4)}px)`,
    transition: theme.transitions.create('width'),
    width: '100%',
    [theme.breakpoints.up('sm')]: {
      width: '12ch',
      '&:focus': {
        width: '20ch',
      },
    },
  },
  paper: {
    position: 'absolute',
    width: 400,
    backgroundColor: theme.palette.background.paper,
    border: '2px solid #000',
    boxShadow: theme.shadows[5],
    padding: theme.spacing(2, 4, 3),
  },
  RightAlignedBox: {
    justifyContent: "flex-end",
    alignItems: "flex-end"
  }, box: {
    height: 100,
    display: "flex",
    padding: 8
  },
  modalRoot: {
    '& > *': {
      margin: theme.spacing(1),
      width: '25ch',
    },
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

export default connect(mapStateToProps, actions)(PatientVisitScreen);