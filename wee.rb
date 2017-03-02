require 'date'
a = [{"unit_rent"=>1926}, {"unit_rent"=>1936}, {"unit_rent"=>2016}, {"unit_rent"=>3026}, {"unit_rent"=>2191}, {"unit_rent"=>1871}, {"unit_rent"=>1891},
   {"unit_rent"=>1891}, {"unit_rent"=>1966}, {"unit_rent"=>3266}, {"unit_rent"=>1881}, {"unit_rent"=>1831}, {"unit_rent"=>1886}, {"unit_rent"=>1956},
    {"unit_rent"=>1836}, {"unit_rent"=>1831}, {"unit_rent"=>1631}, {"unit_rent"=>1616}, {"unit_rent"=>1856}, {"unit_rent"=>1631}, {"unit_rent"=>1831},
     {"unit_rent"=>1846}, {"unit_rent"=>1831}, {"unit_rent"=>1711}, {"unit_rent"=>1721}, {"unit_rent"=>1721}, {"unit_rent"=>1721}, {"unit_rent"=>1721},
      {"unit_rent"=>1756}, {"unit_rent"=>2181}, {"unit_rent"=>2191}, {"unit_rent"=>1876}, {"unit_rent"=>2141}, {"unit_rent"=>1906}, {"unit_rent"=>2346},
       {"unit_rent"=>1916}, {"unit_rent"=>2231}, {"unit_rent"=>1936}, {"unit_rent"=>3321}, {"unit_rent"=>2381}, {"unit_rent"=>2366}, {"unit_rent"=>3011},
        {"unit_rent"=>1801}, {"unit_rent"=>2196}, {"unit_rent"=>2136}, {"unit_rent"=>2136}, {"unit_rent"=>2146}, {"unit_rent"=>2116}, {"unit_rent"=>1821},
         {"unit_rent"=>2}, {"unit_rent"=>2186}, {"unit_rent"=>2951}, {"unit_rent"=>1876}, {"unit_rent"=>2066}, {"unit_rent"=>2096}, {"unit_rent"=>3011},
          {"unit_rent"=>1941}, {"unit_rent"=>2136}, {"unit_rent"=>3096}, {"unit_rent"=>2286}, {"unit_rent"=>2051}, {"unit_rent"=>2136}, {"unit_rent"=>2446},
           {"unit_rent"=>2256}, {"unit_rent"=>2261}, {"unit_rent"=>2121}, {"unit_rent"=>3221}, {"unit_rent"=>2266}, {"unit_rent"=>2261}, {"unit_rent"=>1986},
            {"unit_rent"=>2096}, {"unit_rent"=>2411}, {"unit_rent"=>2016}, {"unit_rent"=>2366}, {"unit_rent"=>2146}, {"unit_rent"=>2176}, {"unit_rent"=>1811},
             {"unit_rent"=>2156}, {"unit_rent"=>2076}, {"unit_rent"=>2086}, {"unit_rent"=>2116}, {"unit_rent"=>1801}, {"unit_rent"=>2196}, {"unit_rent"=>1811},
              {"unit_rent"=>2181}, {"unit_rent"=>2251}, {"unit_rent"=>1996}, {"unit_rent"=>1991}, {"unit_rent"=>2011}, {"unit_rent"=>2346}, {"unit_rent"=>2021},
               {"unit_rent"=>2021}, {"unit_rent"=>2361}, {"unit_rent"=>2236}, {"unit_rent"=>2256}, {"unit_rent"=>1561}, {"unit_rent"=>1536}, {"unit_rent"=>1736},
                {"unit_rent"=>1516}, {"unit_rent"=>1736}, {"unit_rent"=>1906}, {"unit_rent"=>1931}, {"unit_rent"=>2401}, {"unit_rent"=>1711}, {"unit_rent"=>2116},
                 {"unit_rent"=>1546}, {"unit_rent"=>1596}, {"unit_rent"=>1546}, {"unit_rent"=>1736}, {"unit_rent"=>1546}, {"unit_rent"=>1546}, {"unit_rent"=>1831},
                  {"unit_rent"=>1546}, {"unit_rent"=>1466}, {"unit_rent"=>1771}, {"unit_rent"=>1851}, {"unit_rent"=>1866}, {"unit_rent"=>1786}, {"unit_rent"=>1796},
                   {"unit_rent"=>1976}, {"unit_rent"=>1786}, {"unit_rent"=>1861}, {"unit_rent"=>1786}, {"unit_rent"=>1786}, {"unit_rent"=>1831}, {"unit_rent"=>1741},
                    {"unit_rent"=>1831}, {"unit_rent"=>1831}, {"unit_rent"=>1641}, {"unit_rent"=>1896}, {"unit_rent"=>1821}, {"unit_rent"=>1866}, {"unit_rent"=>1771},
                     {"unit_rent"=>1816}, {"unit_rent"=>1601}, {"unit_rent"=>1786}, {"unit_rent"=>1616}, {"unit_rent"=>1631}, {"unit_rent"=>1631}, {"unit_rent"=>1786},
                      {"unit_rent"=>1886}, {"unit_rent"=>1616}, {"unit_rent"=>1841}, {"unit_rent"=>1626}, {"unit_rent"=>1641}, {"unit_rent"=>1806}, {"unit_rent"=>1656},
                       {"unit_rent"=>1686}, {"unit_rent"=>1526}, {"unit_rent"=>1711}, {"unit_rent"=>1346}, {"unit_rent"=>1711}, {"unit_rent"=>1721}, {"unit_rent"=>1721},
                        {"unit_rent"=>1731}, {"unit_rent"=>1356}, {"unit_rent"=>1721}, {"unit_rent"=>1776}, {"unit_rent"=>2196}]


bucket = []
bucket2 = []
a.each {|i| bucket << i["unit_rent"]}
bucket.each {|i| bucket2 << i * 0.0225}
#puts bucket2
7.months.from_now
