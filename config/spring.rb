# frozen_string_literal: true

Spring.watch(
  ".tool-versions",
  "tmp/restart.txt",
  "tmp/caching-dev.txt"
)
