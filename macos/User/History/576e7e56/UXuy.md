# pain points

# parameters/fields list
  hard to manage and fields/parameters list
  hard to make function call with parameter
  hard to distribute parameters over function call based on actual context (class field, class accessors, function local var, ...)

# child data access
  hard to access child meta data
  hard to access parent data

# meta object declaration is fastidious
  takes time to declare metadata + meta object type parameter
  solution: remove type parameter

# hook/custom code is a mess
  hard to write string based code
  problem with invalid code before generation run
  build_runner is fastidious

# better folder dif
1 use gen
2 remove gen
3 edit gen files
4 re-run gen
=> edited files are deleted



# Use cases

triple state consumers for retartable
  started/initial => idle/create

CRUD op on list
  R => stream
  CUD => triple state
how to manage animated list ?