# -*- coding: utf-8 -*-
require 'rails'
require 'active_record'
require 'php_serialize'

module BitrixOnRails
  def self.configure
    return unless ::ActiveRecord::Base.connection.tables.include? 'b_iblock'

    config = Configuration.new
    yield config

    config.infoblocks.each { |infoblock|
      BitrixOnRails.define_iblock_class(infoblock[:iblock_id], infoblock[:options])
    }
  end
end

require 'bitrix_on_rails/engine'
require 'bitrix_on_rails/configuration'
require 'bitrix_on_rails/active_record'
require 'bitrix_on_rails/iblock_element'
require 'bitrix_on_rails/iblock_element_prop_s'
require 'bitrix_on_rails/iblock_element_prop_m'
require 'php_serialize_encoded'

ActiveRecord::Base.extend BitrixOnRails::ActiveRecord
