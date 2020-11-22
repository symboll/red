import { memo, useMemo } from 'react'
import dayjs from 'dayjs'
import { h } from '@/util/lib'
import PropTypes from 'prop-types'
import './depart_date.styl'

const DepartDate = (props) => {

  const { departDate, departDateChoose } = props

  const isToday =  h(departDate) === h()
  const weekToString = '周'
      + ['日', '一', '二', '三', '四', '五', '六'][new Date(departDate).getDay()]
      + (isToday ? '(今天)' : '');


  const dateToString = useMemo(() => {
    return dayjs(departDate).format('YYYY-MM-DD')
  }, [departDate])

  return <div className="date_choice_wrap" onClick={ departDateChoose }>
    <input type="hidden" value={dateToString}/>
    {dateToString} <span >{ weekToString }</span> 
  </div>
}

DepartDate.propTypes = {
  departDate: PropTypes.number.isRequired,
  departDateChoose: PropTypes.func.isRequired
}

export default memo(DepartDate)