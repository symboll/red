import React, { memo } from 'react';
import { connect } from 'react-redux';

const mapStateToProps = (state, ownProps) => ({
  name: state.home.name
})


const mapDispatchToProps = (dispatch, ownProps) => ({
  
})

const Home = ({ name }) => {
  return (
    <div>
      name: { name }
    </div>
  )
}


export default connect(mapStateToProps, mapDispatchToProps)(memo(Home))