# Set up dummy data for Development environment use
teas_data = [
  {
    title: 'English Breakfast Tea',
    description: 'A classic black tea blend known for its robust and full-bodied flavor. It\'s often enjoyed with milk and sugar.',
    temperature: 200,
    brew_time: 3
  },
  {
    title: 'Green Tea',
    description: 'A light and refreshing tea with a grassy, vegetal flavor. Green tea is rich in antioxidants and is known for its health benefits.',
    temperature: 175,
    brew_time: 2
  },
  {
    title: 'Chamomile Tea',
    description: 'A caffeine-free herbal tea made from dried chamomile flowers. It has a refreshing and minty taste.',
    temperature: 212,
    brew_time: 5
  },
  {
    title: 'Oolong Tea',
    description: 'Oolong tea is a partially oxidized tea with a flavor profile that falls between green and black teas. It has a complex taste with floral and fruity notes.',
    temperature: 185,
    brew_time: 3
  },
  {
    title: 'Earl Grey Tea',
    description: 'A black tea infused with the essence of bergamot oranges, resulting in a fragrant and citrusy flavor.',
    temperature: 212,
    brew_time: 3
  },
  {
    title: 'Peppermint Tea',
    description: 'A caffeine-free herbal tea made from dried peppermint leaves. It has a refreshing and minty taste.',
    temperature: 212,
    brew_time: 4
  },
  {
    title: 'Darjeeling Tea',
    description: 'Known as the "Champagne of Teas," Darjeeling tea is a light and delicate black tea with floral and fruity notes.',
    temperature: 200,
    brew_time: 3
  },
  {
    title: 'Jasmine Tea',
    description: 'A green tea scented with jasmine flowers, resulting in a fragrant and floral infusion.',
    temperature: 175,
    brew_time: 2
  },
  {
    title: 'Chai Tea',
    description: 'A spiced black tea often brewed with a mixture of spices like cinnamon, cardamom, and cloves. It has a warm and spicy flavor.',
    temperature: 212,
    brew_time: 5
  },
  {
    title: 'White Tea',
    description: 'A subtle and delicate tea made from young tea leaves and buds. It has a mild and slightly sweet flavor.',
    temperature: 175,
    brew_time: 2
  }
]

# Safely create the database entries for Development environment
teas_data.each do |tea_data|
  tea = Tea.find_or_initialize_by(title: tea_data[:title])
  tea.update(tea_data)
end
