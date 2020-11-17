import React, { memo, useCallback } from 'react';
import { connect } from 'react-redux';

import { Journey, DateChoice, HighSpeed, Submit } from './components'
import Header from '@/common/header'

import { exchange } from './store/actionCreates'

const mapStateToProps = (state, ownProps) => ({
  to: state.getIn(['home', 'to']),
  from: state.getIn(['home', 'from'])  
})


const mapDispatchToProps = (dispatch, ownProps) => ({
  exchangeFromTo () {
    dispatch(exchange())
  }
})



const Home = ({ from ,to,  exchangeFromTo }) => {
  const handleBack = useCallback(() => {
    console.log(123)
  }, []) 

  // const exchangeFromTo = useCallback(() => {
  //   console.log(345)
  // }, [])
  return (
    <>
      <Header 
        title={'火车票'}
        onBack={ handleBack }
      />
      <Journey 
        to={to}
        from={from}
        exchangeFromTo={ exchangeFromTo }
      />
      <DateChoice />
      <HighSpeed />
      <Submit />
    </>
  )
}


export default connect(mapStateToProps, mapDispatchToProps)(memo(Home))