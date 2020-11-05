import React, { memo } from 'react';
import { connect } from 'react-redux';
import './index.styl'


const mapStateToProps = (state, ownProps) => ({

})


const mapDispatchToProps = (dispatch, ownProps) => ({

})

const About = () => {
  return (
    <div className="test">
      About
    </div>
  )
}


export default connect(mapStateToProps, mapDispatchToProps)(memo(About))