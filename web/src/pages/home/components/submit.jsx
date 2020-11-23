import { memo } from 'react'
import './submit.styl'

const Submit = () => {
  return (
    <div className="submit">
      <button type="submit" className="submit-button">
        搜索
      </button>
    </div>
  )
}

export default memo(Submit)
