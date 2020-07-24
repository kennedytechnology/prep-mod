Ransack.configure do |config|
  config.add_predicate 'date_equals',
    arel_predicate: 'eq',
    formatter: proc { |v| v.to_date },
    validator: proc { |v| v.present? },
    type: :string

  config.custom_arrows = {
    up_arrow:   '&#8693;',
    down_arrow: '&#8693;',
    default_arrow: '&#8693;'
  }
end