const normalize = (s) => [...s.toLowerCase()].sort().join('');
const isAnagram = (a, b) => normalize(a) == normalize(b);

class Anagram {
  constructor(target) {
    this.target = target.toLowerCase();
  }

  matches(candidates) {
    candidates = Array.isArray(candidates) ? candidates : Array.from(arguments);
    const t = this.target;
    return candidates
      .filter((c) => t.toLowerCase() != c.toLowerCase() && isAnagram(t, c));
  }
}

export default Anagram;
