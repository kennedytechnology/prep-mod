class SupplyInventoriesImport
  include ActiveModel::Model
  require 'roo'

  attr_accessor :file

  def initialize(attributes={})
    attributes.each { |name, value| send("#{name}=", value) }
  end

  def persisted?
    false
  end

  def open_spreadsheet
    case File.extname(file.original_filename)
    when ".csv" then Roo::CSV.new(file.path)
    when ".xls" then Roo::Excel.new(file.path, nil, :ignore)
    when ".xlsx" then Roo::Excelx.new(file.path)
    else raise "Unknown file type: #{file.original_filename}"
    end
  end

  def load_imported_items
    spreadsheet = open_spreadsheet
    return if spreadsheet.first_row.nil?
    spreadsheet.first_row.nil?
    header = spreadsheet.row(1)
    (2..spreadsheet.last_row).map do |i|
      row = Hash[[header, spreadsheet.row(i)].transpose]
      item = SupplyInventory.find_by_id(row["id"]) || SupplyInventory.new
      if row.to_hash.keys.difference(SupplyInventory.columns.collect(&:name)).any?
        item.errors.add(:base, "Content is invalid!")
      else
        item.attributes = row.to_hash
      end

      item
    end
  end

  def imported_items
    @imported_items ||= load_imported_items
  end

  def save
    if file.blank?
      self.errors.add(:base, "No file imported!")
      return false 
    end
  
    unless [".csv", ".xls", ".xlsx"].include?(File.extname(file.original_filename))
      self.errors.add(:base, "Unknown file type: #{file.original_filename}")
      return false
    end

    if imported_items.blank?
      self.errors.add(:base, "#{file.original_filename} shouldn't be empty!")
      return false
    end

    if imported_items.map(&:valid?).all?
      imported_items.each(&:save!)
      true
    else
      imported_items.each_with_index do |item, index|
        item.errors.full_messages.each do |msg|
          errors.add :base, "Row #{index + 6}: #{msg}"
        end
      end
      false
    end
  end

end