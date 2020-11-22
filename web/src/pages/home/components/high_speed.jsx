import PropTypes from 'prop-types'
// import classnames from 'classnames'
import './high_speed.styl'

const HighSpeed = (props) => {
  const { highSpeed, toggle } = props
  return <div>
    只看高铁 { JSON.stringify(highSpeed) }
    <button onClick={toggle}>Btn</button>
  </div>
}

HighSpeed.propTypes = {
  highSpeed: PropTypes.bool.isRequired,
  toggle: PropTypes.func.isRequired,
}

export default HighSpeed