module ReportHelper
  def parse_chart_data(data)
    chart_data_datasets = []
    data.each do |key, value|
      dataset = {}
      dataset['name'] = key
      dataset['data'] = { key => value }
      chart_data_datasets << dataset
    end
  end

  def column_chart_background_colors
    {
      fill: false,
      backgroundColor: [
        'rgba(75, 192, 192, 0.5)',
        'rgba(255, 99, 132, 0.5)',
        'rgba(255, 159, 64, 0.5)',
        'rgba(255, 205, 86, 0.5)',
        'rgba(54, 162, 235, 0.5)',
        'rgba(153, 102, 255, 0.5)',
        'rgba(201, 203, 207, 0.5)'
      ],
      borderColor: [
        'rgba(75, 192, 192)',
        'rgba(255, 99, 132)',
        'rgba(255, 159, 64)',
        'rgba(255, 205, 86)',
        'rgba(54, 162, 235)',
        'rgba(153, 102, 255)',
        'rgba(201, 203, 207)'
      ],
      borderWidth: 1
    }
  end
end