# frozen_string_literal: true
require 'bundler/setup'
require_relative 'db'
require_relative 'schema'
require 'logger'
DB.logger = Logger.new($stdout)
