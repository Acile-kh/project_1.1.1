import 'package:flutter/material.dart';

void main() {
  runApp(MealApp());
}

class MealApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MealScreen(),
    );
  }
}

class MealScreen extends StatefulWidget {
  @override
  _MealScreenState createState() => _MealScreenState();
}

class _MealScreenState extends State<MealScreen> {
  // Dropdown value
  String selectedMeal = "Breakfast";

  // Radio value
  String diet = "Normal";

  List<String> getMeals() {
    if (selectedMeal == "Breakfast" && diet == "Normal") {
      return ["Egg Sandwich", "Pancakes", "Milk & Cereal"];
    } else if (selectedMeal == "Breakfast" && diet == "Vegetarian") {
      return ["Oatmeal", "Fruit Salad", "Peanut Butter Toast"];
    } else if (selectedMeal == "Breakfast" && diet == "High Protein") {
      return ["Protein Shake", "Boiled Eggs", "Greek Yogurt"];
    }

    if (selectedMeal == "Lunch" && diet == "Normal") {
      return ["Chicken Wrap", "Burger", "Rice & Vegetables"];
    } else if (selectedMeal == "Lunch" && diet == "Vegetarian") {
      return ["Vegetable Pasta", "Falafel Plate", "Veggie Burger"];
    } else if (selectedMeal == "Lunch" && diet == "High Protein") {
      return ["Grilled Chicken", "Beef Bowl", "Salmon Salad"];
    }

    if (selectedMeal == "Dinner" && diet == "Normal") {
      return ["Pizza", "Soup & Bread", "Chicken Rice"];
    } else if (selectedMeal == "Dinner" && diet == "Vegetarian") {
      return ["Veggie Soup", "Pasta Alfredo", "Salad Bowl"];
    } else if (selectedMeal == "Dinner" && diet == "High Protein") {
      return ["Steak", "Chicken Breast", "Protein Salad"];
    }

    return [];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Healthy Meal Recommender"),
          backgroundColor: Colors.green,
        ),
        body: Padding(
            padding: EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Choose Meal Type:", style: TextStyle(fontSize: 18)),
                DropdownButton<String>(
                  value: selectedMeal,
                  items: ["Breakfast", "Lunch", "Dinner"]
                      .map((e) => DropdownMenuItem(value: e, child: Text(e)))
                      .toList(),
                  onChanged: (value) {
                    setState(() {
                      selectedMeal = value!;
                    });
                  },
                ),

                SizedBox(height: 20),

                Text("Diet Preference:", style: TextStyle(fontSize: 18)),

                RadioListTile(
                  title: Text("Normal"),
                  value: "Normal",
                  groupValue: diet,
                  onChanged: (value) {
                    setState(() => diet = value.toString());
                  },
                ),
                RadioListTile(
                  title: Text("Vegetarian"),
                  value: "Vegetarian",
                  groupValue: diet,
                  onChanged: (value) {
                    setState(() => diet = value.toString());
                  },
                ),
                RadioListTile(
                  title: Text("High Protein"),
                  value: "High Protein",
                  groupValue: diet,
                  onChanged: (value) {
                    setState(() => diet = value.toString());
                  },
                ),

                SizedBox(height: 20),
                Text("Recommended Meals:", style: TextStyle(fontSize: 18)),

                Expanded(
                  child: ListView(
                    children: getMeals()
                        .map((meal) => ListTile(
                      leading: Icon(Icons.restaurant),
                      title: Text(meal),
                    ))
                        .toList(),
                  ),
                )
              ],
            ),
            ),
        );
    }
}