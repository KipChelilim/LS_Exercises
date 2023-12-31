# PEDAC - start 3:19, finish 3:38
  # Problem
    # explicit rules:
      # accept two strings as inputs
      # determine the shortest of the two
      # return a single string with shortest, longest, then shortest concatenated
      # assume strings are of different lengths

    # implicit rules:
      # accept blank strings, will not have a special output

    # questions:
      # strings with only a space? do we care about any of the characters at all? (no if they are string)
      # error messages if non strings? (generic one)

    # inputs: string_1, string_2
    # output: string_1string_2string_1

  # Examples:
    # "abc", "defgh" => "abcdefghabc"
    # "abcde", "fgh" => "fghabcdefgh"
    # "", "xyz"      => "xyz"
    # " ", "abc"     => " abc "
    # nil, "abc"     => Please enter string values only

  # Data: strings
  # Algorithm:
    # - accept two strings
    # - check if they are both strings and return error if not
    # - calculate length of both strings
    # - compare length of strings and flag the shortest one
    # - concatenate the short string with long, then with short again
    # - return final result
  # Code:

def short_long_short(string_1, string_2)
  unless [string_1, string_2].all? { |string| string.class == String }
    return "Please enter string values only."
  end

  string_1_length = string_1.size
  string_2_length = string_2.size

  if string_1_length < string_2_length
    short_string = string_1
    long_string = string_2
  else
    short_string = string_2
    long_string = string_1
  end

  # Refactor opportunity: Put this in the if/else statement and get rid of extra variables.
  short_string + long_string + short_string
end

p short_long_short('abc', 'defgh') == "abcdefghabc"
p short_long_short('abcde', 'fgh') == "fghabcdefgh"
p short_long_short('', 'xyz') == "xyz"
p short_long_short(' ', 'abc') == " abc "
p short_long_short(nil, 'abc') == "Please enter string values only."