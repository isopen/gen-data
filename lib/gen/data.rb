require "gen/data/version"

module Gen
  module Data
    def Data.request_data(r)
      c = []
      len = r.length;
      case len
      when 1
        c << r[0]
      when 2
        c << r[0]
        c << r[1]
        c << r[0].merge(r[1])
      when (3..len)
        c << r[0]
        c << r[1]
        c << r[2]
        c << r[0].merge(r[1])
        c << r[0].merge(r[2])
        c << r[1].merge(r[2])
        c << r[0].merge(r[1]).merge(r[2])
        t = r[3, len]
        t.length.times { |j|
          c.length.times { |i|
            c << c[i].dup.merge(t[j])
          }
          c << t[j]
        }
        c << {}
      end  
      return c;
    end
  end
end
