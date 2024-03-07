lower_case_alpha = ('a'..'z').to_a
lower_case_rot = lower_case_alpha.rotate(13)
lower_case_mapping = lower_case_rot.zip(lower_case_alpha)
upper_case_mapping = lower_case_mapping.map { |pair| pair.map(&:upcase) }

MAPPING = lower_case_mapping.concat(upper_case_mapping).to_h

names = [
  "Nqn Ybirynpr",
  "Tenpr Ubccre",
  "Nqryr Tbyqfgvar",
  "Nyna Ghevat",
  "Puneyrf Onoontr",
  "Noqhyynu Zhunzznq ova Zhfn ny-Xujnevmzv",
  "Wbua Ngnanfbss",
  "Ybvf Unvog",
  "Pynhqr Funaaba",
  "Fgrir Wbof",
  "Ovyy Tngrf",
  "Gvz Orearef-Yrr",
  "Fgrir Jbmavnx",
  "Xbaenq Mhfr",
  "Fve Nagbal Ubner",
  "Zneiva Zvafxl",
  "Lhxvuveb Zngfhzbgb",
  "Unllvz Fybavzfxv",
  "Tregehqr Oynapu"
]

puts(names.map do |name|
  name.chars.map do |char|
    MAPPING[char].nil? ? char : MAPPING[char]
  end.join
end)