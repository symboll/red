import React, { memo } from 'react';
import { connect } from 'react-redux';

import { Journey, DateChoice, HighSpeed, Submit } from './components'
import Header from '@/common/header'

const mapStateToProps = (state, ownProps) => ({
  name: state.getIn(['home', 'name'])  
})


const mapDispatchToProps = (dispatch, ownProps) => ({
  
})

const Home = ({ name }) => {
  return (
    <>
      <Header />
      <Journey />
      <DateChoice />
      <HighSpeed />
      <Submit />
    </>
  )
}


export default connect(mapStateToProps, mapDispatchToProps)(memo(Home))