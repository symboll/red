import { useState, useCallback } from 'react'
import classNames from 'classnames'
import PropTypes from "prop-types"
import switchImg from "./switch.svg"
import "./journey.styl"


const Journey = ({ from, to, exchangeFromTo }) => {
  const [animation , setAnimation] =useState(false)

  const handleExchangeFromTo = useCallback(
    () => {
      setAnimation((animation) => !animation)
      exchangeFromTo()
    },[])

  return (
    <div className="journey">
      <div className="journey-station">
        <input
          type="text"
          value={from}
          readOnly
          className="journey-from journey-input"
        />
      </div>
      <div 
        className={classNames({
          'journey-switch': true,
          'journey-switch-reverse': animation
        })} 
        onClick={handleExchangeFromTo}
      >
        <img src={switchImg} alt="" width="70" height="40" />
      </div>
      <div className="journey-station">
        <input
          type="text"
          value={to}
          readOnly
          className="journey-to journey-input"
        />
      </div>
    </div>
  )
}

Journey.propTypes = {
  to: PropTypes.string,
  from: PropTypes.string,
}
export default Journey
