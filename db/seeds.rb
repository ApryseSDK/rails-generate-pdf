STATUSES = ["draft", "sent", "paid"]
USERS = [
  {
    full_name: "Earl A. Gott",
    address: "1923 Stiles Street, Pittsburgh, PA 15226",
    email: "earlagott@rhyta.com",
    phone: "412-571-8270"
  },
  {
    full_name: "Rachelle S. Vargas",
    address: "974 Haymond Rocks Road, Scottsburg, OR 97473",
    email: "rachellesvargas@dayrep.com",
    phone: "541-587-6332"
  },
  {
    full_name: "Gladys H. Sheffield",
    address: "1626 Hidden Meadow Drive, Des Lacs, ND 58733",
    email: "gladyshsheffield@rhyta.com",
    phone: "701-725-9343"
  },
  {
    full_name: "Effie L. Goode",
    address: "3889 Dogwood Lane, Tucson, AZ 85710",
    email: "effielgoode@rhyta.com",
    phone: "520-731-5031"
  },
  {
    full_name: "Monique D. Estep",
    address: "957 Hamill Avenue, San Diego, CA 92103",
    email: "moniquedestep@dayrep.com",
    phone: "858-360-1802"
  },
  {
    full_name: "Timothy I. Atwood",
    address: "3402 Raver Croft Drive, Chattanooga, TN 37421",
    email: "timothyiatwood@teleworm.us",
    phone: "423-645-9346"
  },
  {
    full_name: "Sherry F. Maldonado",
    address: "3058 Freedom Lane, Stockton, CA 95202",
    email: "sherryfmaldonado@armyspy.com",
    phone: "209-461-8106"
  },
  {
    full_name: "Wendy A. Collins",
    address: "2824 Broadway Street, Charleston, SC 29405",
    email: "wendyacollins@teleworm.us",
    phone: "843-744-5410"
  },
  {
    full_name: "Michelle J. Horton",
    address: "2125 Green Hill Road, Springdale, AR 72764",
    email: "michellejhorton@rhyta.com",
    phone: "479-361-1375"
  },
  {
    full_name: "Marc S. Irizarry",
    address: "4514 Big Elm, Richmond, MO 64085",
    email: "marcsirizarry@jourrapide.com",
    phone: "816-776-0200"
  }
]

PRODUCTS = [
  {
    name: "Nestea - Ice Tea, Diet",
    price: 50.7,
    qty: 8,
    description: "Team-oriented logistical policy"
  },
  {
    name: "Pork - Hock And Feet Attached",
    price: 39.17,
    qty: 10,
    description: "Programmable contextually-based local area network"
  },
  {
    name: "Squash - Acorn",
    price: 35.54,
    qty: 1,
    description: "Down-sized zero administration productivity"
  },
  {
    name: "Carbonated Water - Cherry",
    price: 34.83,
    qty: 10,
    description: "Seamless transitional installation"
  },
  {
    name: "Tea - Lemon Green Tea",
    price: 22.13,
    qty: 7,
    description: "Advanced background emulation"
  },
  {
    name: "Bread - Pita",
    price: 34.94,
    qty: 2,
    description: "Automated tangible system engine"
  },
  {
    name: "Soup - Knorr, Classic Can. Chili",
    price: 9.9,
    qty: 9,
    description: "Enhanced scalable conglomeration"
  },
  {
    name: "Pork - Ham, Virginia",
    price: 74.52,
    qty: 7,
    description: "Automated optimizing policy"
  },
  {
    name: "Capers - Ox Eye Daisy",
    price: 8.79,
    qty: 2,
    description: "Integrated asynchronous local area network"
  },
  {
    name: "Tomatoes",
    price: 88.7,
    qty: 5,
    description: "Expanded upward-trending paradigm"
  },
  {
    name: "Sword Pick Asst",
    price: 21.87,
    qty: 5,
    description: "Switchable logistical protocol"
  },
  {
    name: "Beans - Black Bean, Canned",
    price: 71.19,
    qty: 5,
    description: "Cross-group static challenge"
  },
  {
    name: "Oil - Truffle, Black",
    price: 75.6,
    qty: 1,
    description: "Robust contextually-based Graphical User Interface"
  },
  {
    name: "Breadfruit",
    price: 66.78,
    qty: 8,
    description: "Inverse mission-critical circuit"
  },
  {
    name: "Soupcontfoam16oz 116con",
    price: 22.27,
    qty: 5,
    description: "Customer-focused bandwidth-monitored architecture"
  },
  {
    name: "Vodka - Smirnoff",
    price: 13.77,
    qty: 7,
    description: "Object-based demand-driven conglomeration"
  },
  {
    name: "Beans - Kidney White",
    price: 48.64,
    qty: 2,
    description: "Customizable background product"
  },
  {
    name: "Filter - Coffee",
    price: 33.75,
    qty: 2,
    description: "Up-sized actuating moratorium"
  },
  {
    name: "Ice Cream - Life Savers",
    price: 71.39,
    qty: 1,
    description: "Cloned optimal benchmark"
  },
  {
    name: "Cheese - Gorgonzola",
    price: 23.66,
    qty: 6,
    description: "Stand-alone reciprocal architecture"
  }
]

Invoice.all.destroy_all

10.times do
    from = USERS[rand(0..9)]
    to = USERS[rand(0..9)]

    invoice = Invoice.create(
      status: STATUSES[rand(0..2)],
      from_full_name: from[:full_name],
      from_address: from[:address],
      from_email: from[:email],
      from_phone: from[:phone],
      to_full_name: to[:full_name],
      to_address: to[:address],
      to_email: to[:email],
      to_phone: to[:phone],
      discount: rand(0.0..20).round(2),
      vat: [5, 10, 15, 20][rand(0..3)]
    )

    (rand(1..5)).times do
      product = PRODUCTS[rand(0..19)]
      invoice_item = InvoiceItem.create(
        name: product[:name],
        description: product[:description],
        price: product[:price],
        qty: product[:qty],
        invoice: invoice
      )
    end

end
