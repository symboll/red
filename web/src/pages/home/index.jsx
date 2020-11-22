import React, { memo, useCallback } from 'react';
import { connect } from 'react-redux';

import { Journey, DepartDate, HighSpeed, Submit } from './components'
import Header from '@/common/header'

import { exchange, speedtoggle } from './store/actionCreates'

const mapStateToProps = (state, ownProps) => ({
  to: state.getIn(['home', 'to']),
  from: state.getIn(['home', 'from']), 
  departDate: state.getIn(['home', 'departDate']),
  highSpeed: state.getIn(['home', 'highSpeed'])
})


const mapDispatchToProps = (dispatch, ownProps) => ({
  exchangeFromTo () {
    dispatch(exchange())
  },
  highSpeedToggle() {
    dispatch(speedtoggle())
  }
})



const Home = (props) => {

  const { from ,to, departDate, highSpeed } = props
  const { exchangeFromTo } = props

  const handleBack = useCallback(() => {
    console.log(123)
  }, []) 

  const departDateChoose = useCallback(() => {
    console.log(234)
  }, [])

  const highSpeedToggle = useCallback(() => {
    props.highSpeedToggle()
  }, [])
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
      <DepartDate 
        departDate={departDate}
        departDateChoose={departDateChoose}
      />
      <HighSpeed 
        highSpeed={highSpeed}
        toggle={highSpeedToggle}
      />
      <Submit />
    </>
  )
}


export default connect(mapStateToProps, mapDispatchToProps)(memo(Home))