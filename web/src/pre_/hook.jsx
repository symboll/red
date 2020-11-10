import React, { 
  useState,
  useEffect,
  createContext,
  useContext,
  useMemo,
  useCallback,
  useRef,
  forwardRef,
  memo  } from 'react'


const CountContext = createContext()

const Hook = props => {
  const CounterRef = useRef()
  
  const [count, setCount] = useState(() => props.count || 0)
  const [size, setSize] = useState({
    width: document.documentElement.clientWidth,
    height: document.documentElement.clientHeight
  })
  const onResize = () => {
    setSize({
      width: document.documentElement.clientWidth,
      height: document.documentElement.clientHeight
    })
  }
  useEffect(() => {
    document.title = count
  })
  useEffect(() => {
    window.addEventListener('resize',  onResize, false)
    return () => window.removeEventListener('resize', onResize, false)
  }, [])
  
  const double = useMemo(() => {
        return count * 2
  }, [count === 3])

  // const click = useMemo(()=> {
  //   return () => {
  //     console.log('click')
  //   }
  // }, [])
  const click = useCallback(()=> {
    console.log(CounterRef.current)
  } , [])

  // useMemo(()=> fn) === useCallback(fn)

  

  return (
    <>
      <h1>{ count }</h1>
      <h2>{size.height} * { size.width }</h2>
      <button onClick={ () => setCount(count => count + 1)}>btn</button>
      <CountContext.Provider value={count}>
        <Middle />
      </CountContext.Provider>

      <Counter ref={CounterRef}  count={double} handleClick={click}/>
    </>
  )
}

const Counter = memo(forwardRef(function ({ count, handleClick }, ref) {
  console.log('Counter render! ', count)
  return (
    <div onClick={ handleClick } ref={ref}>
      { count }
    </div>
  )
}))

// forwardRef((props, ref) => {})


function Middle () {
  return (<Leaf />)
}

function Leaf () {
  const count = useContext(CountContext)
  return (
    <div>
      { count }
    </div>
  )
}
export default Hook