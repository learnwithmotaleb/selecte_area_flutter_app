import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: AreaSelectorScreen(),
    );
  }
}

class AreaSelectorScreen extends StatefulWidget {
  @override
  _AreaSelectorScreenState createState() => _AreaSelectorScreenState();
}

class _AreaSelectorScreenState extends State<AreaSelectorScreen> {
  Map<String, Map<String, List<String>>> areaData = {
    'Dhaka': {
      'Dhaka': ['Dhanmondi', 'Mohammadpur', 'Gulshan', 'Uttara', 'Mirpur'],
      'Gazipur': ['Gazipur Sadar', 'Tongi', 'Kaliakair'],
      'Narayanganj': ['Narayanganj Sadar', 'Rupganj', 'Sonargaon'],
    },
    'Chittagong': {
      'Chittagong': ['Patenga', 'Kotwali', 'Halishahar', 'Pahartali'],
      'Cox\'s Bazar': ['Teknaf', 'Ramu', 'Ukhiya'],
    },
    'Sylhet': {
      'Sylhet': ['Beanibazar', 'Jaintapur', 'Golapganj', 'Zakiganj'],
      'Moulvibazar': ['Sreemangal', 'Kamalganj', 'Rajnagar'],
    }
  };

  String? selectedArea;
  String? selectedSubArea;
  String? selectedThana;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Bangladesh Area',
          style: TextStyle(fontSize: 18, color: Colors.white),
        ),
        backgroundColor: Colors.blue,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Area Dropdown
            Container(
              width: double.infinity, // Ensures full width
              padding: EdgeInsets.all(15), // Optional: Add padding for a nicer look
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey), // Add border if needed
                borderRadius: BorderRadius.circular(8), // Rounded corners
              ),
              child: DropdownButton<String>(
                hint: Text('Select Division'),
                iconEnabledColor: Colors.black,
                dropdownColor: Colors.white,
                itemHeight: 50.0,
                isDense: true,
                underline: Container(
                  width: double.infinity,
                  height: 2,
                ),
                borderRadius: BorderRadius.circular(8),
                value: selectedArea,
                onChanged: (newValue) {
                  setState(() {
                    selectedArea = newValue;
                    selectedSubArea = null; // Reset sub-area and thana
                    selectedThana = null;
                  });
                },
                items: areaData.keys.map((area) {
                  return DropdownMenuItem<String>(
                    value: area,
                    child: Text(area),
                  );
                }).toList(),
                isExpanded: true, // Ensures dropdown takes the full width
              ),
            ),

            // Sub-Area Dropdown
            if (selectedArea != null)
              SizedBox(
                height: 10,
              ),
            if (selectedArea != null)
              Container(
                width: double.infinity, // Ensures full width
                padding: EdgeInsets.all(15), // Optional: Add padding for a nicer look
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey), // Add border if needed
                  borderRadius: BorderRadius.circular(8), // Rounded corners
                ),
                child: DropdownButton<String>(
                  hint: Text('Select District'),
                  value: selectedSubArea,
                  onChanged: (newValue) {
                    setState(() {
                      selectedSubArea = newValue;
                      selectedThana = null; // Reset thana
                    });
                  },
                  items: selectedArea != null
                      ? areaData[selectedArea]!.keys.map((subArea) {
                    return DropdownMenuItem<String>(
                      value: subArea,
                      child: Text(subArea),
                    );
                  }).toList()
                      : [],
                  isExpanded: true,
                ),
              ),

            // Thana Dropdown
            if (selectedSubArea != null)
              SizedBox(
                height: 10,
              ),
            if (selectedSubArea != null)
              Container(
                width: double.infinity, // Ensures full width
                padding: EdgeInsets.all(15), // Optional: Add padding for a nicer look
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey), // Add border if needed
                  borderRadius: BorderRadius.circular(8), // Rounded corners
                ),
                child: DropdownButton<String>(
                  hint: Text('Select Thana'),
                  value: selectedThana,
                  onChanged: (newValue) {
                    setState(() {
                      selectedThana = newValue;
                    });
                  },
                  items: selectedSubArea != null
                      ? areaData[selectedArea]![selectedSubArea]!.map((thana) {
                    return DropdownMenuItem<String>(
                      value: thana,
                      child: Text(thana),
                    );
                  }).toList()
                      : [],
                  isExpanded: true,
                ),
              ),

            // Show selected area, sub-area, thana
            SizedBox(height: 20),
            if (selectedThana != null)
              Text(
                'Selected Division: $selectedArea, \nDistrict: $selectedSubArea, \nThana: $selectedThana',
              ),
          ],
        ),
      ),
    );
  }
}
