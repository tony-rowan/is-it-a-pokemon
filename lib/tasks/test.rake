namespace(:test) do
  desc("Run JS Tests via Yarn")
  task(:js) { `yarn test` }
end
