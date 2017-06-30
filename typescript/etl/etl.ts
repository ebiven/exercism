type InputFormat = {[key: string]: string[]};
type OutputFormat = {[key: string]: number};

const transform = (from: InputFormat): OutputFormat => {
  const reducer = (acc: OutputFormat, k: string): OutputFormat => {
    from[k].forEach((v: string) => acc[v.toLowerCase()] = +k);
    return acc;
  };

  const start: OutputFormat = {};
  return Object.keys(from).reduce(reducer, start);
};

export default transform;