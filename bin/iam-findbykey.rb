#!/usr/bin/env ruby

require 'iam-findbykey'

i = Iam::FindByKey.new(ARGV)
i.run
