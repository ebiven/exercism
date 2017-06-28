const transform = (from) => {
  const reducer = (acc, k) => {
    from[k].forEach((v) => acc[v.toLowerCase()] = +k);
    return acc;
  };

  return Object.keys(from).reduce(reducer, {});
}

export default transform;