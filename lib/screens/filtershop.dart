import 'package:flutter/material.dart';

class FilterScreen extends StatefulWidget {
  @override
  _FilterScreenState createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  String selectedCategory = 'Category'; // Default selected category
  String selectedFilter = 'Chokers'; // Default selected filter
  List<String> categories = [
    'Category',
    'Gender',
    'Craft',
    'Fabric',
    'Color',
    'Price',
    'Occasion',
    'Discount',
    'Rating',
    'Size',
    'Combo',
    'Material',
    'Item Type',
    'Dispatch In',
    'Offer'
  ];

  List<String> filters = [
    'Pendants',
    'Chokers',
    'Chains',
    'Charm',
    'Crystal',
    'Name',
    'Beaded',
    'Rani Haar',
    'Mangalsutra'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: const IconThemeData(color: Color(0xFF5D2E17)),
        title: Text(
          "Filter",
          style: TextStyle(color: Color(0xFF5D2E17)),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Divider(),
          Expanded(
            child: Row(
              children: [
                // Categories Section
                Expanded(
                  flex: 2,
                  child: Container(
                    height: MediaQuery.of(context).size.height,
                    padding: EdgeInsets.only(bottom: 80),
                    color: Colors.white,
                    child: ListView.builder(
                      itemCount: categories.length,
                      itemBuilder: (context, index) {
                        return ListTile(
                          title: Text(
                            categories[index],
                            style: TextStyle(
                              color: categories[index] == selectedCategory
                                  ? Color(0xFF5D2E17)
                                  : Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          onTap: () {
                            setState(() {
                              selectedCategory = categories[index];
                            });
                          },
                        );
                      },
                    ),
                  ),
                ),
                VerticalDivider(width: 1, color: Colors.black12),
                // Filter Options Section
                Expanded(
                  flex: 3,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8.0),
                          child: Text(
                            'Filter by ${selectedCategory}',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 8),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(color: Colors.black12),
                          ),
                          child: TextField(
                            decoration: InputDecoration(
                              icon:
                                  Icon(Icons.search, color: Color(0xFF5D2E17)),
                              hintText: 'Search',
                              border: InputBorder.none,
                            ),
                          ),
                        ),
                        Expanded(
                          child: ListView.builder(
                            itemCount: filters.length,
                            itemBuilder: (context, index) {
                              return CheckboxListTile(
                                activeColor: Color(0xFF5D2E17),
                                title: Text(filters[index]),
                                value: filters[index] == selectedFilter,
                                onChanged: (bool? value) {
                                  setState(() {
                                    selectedFilter = filters[index];
                                  });
                                },
                              );
                            },
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              ElevatedButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.brown.shade700,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                ),
                                child: Text(
                                  'CLOSE',
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                              ElevatedButton(
                                onPressed: () {
                                  Navigator.pop(context, selectedFilter);
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.brown.shade700,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                ),
                                child: Text(
                                  'APPLY',
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
