def list_groups(array)
  yield(array)
end

list = %w(raven finch hawk eagle)

list_groups(list) do |_, _, *raptors|
  p raptors
end