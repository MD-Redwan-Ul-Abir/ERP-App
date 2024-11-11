import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';

import '../utils/widgets/customAppDrawer.dart';

class PurchaseFormPage extends StatefulWidget {
  @override
  _PurchaseFormPageState createState() => _PurchaseFormPageState();
}

class _PurchaseFormPageState extends State<PurchaseFormPage> {
  final _formKey = GlobalKey<FormState>();
  String? _selectedSupplier;
  String? _purchaseStatus;
  DateTime? _purchaseDate;
  String? _fileName;

  // Function to pick a file
  Future<void> _pickFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();

    if (result != null) {
      setState(() {
        _fileName = result.files.single.name;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add New Purchase"),
        actions: [
          IconButton(
            icon: Icon(Icons.close),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      ),
      drawer: CustomAppDrawer(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Card(
            elevation: 2,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Purchase Details",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                    ),
                    SizedBox(height: 16),

                    // Supplier Dropdown
                    Row(
                      children: [
                        Expanded(
                          child: DropdownButtonFormField<String>(
                            decoration: InputDecoration(
                              labelText: "Supplier*",
                              border: OutlineInputBorder(),
                            ),
                            value: _selectedSupplier,
                            items: ['Supplier A', 'Supplier B', 'Supplier C']
                                .map((supplier) => DropdownMenuItem(
                                      value: supplier,
                                      child: Text(supplier),
                                    ))
                                .toList(),
                            onChanged: (value) {
                              setState(() {
                                _selectedSupplier = value;
                              });
                            },
                          ),
                        ),
                        SizedBox(width: 10),
                        IconButton(
                          icon: Icon(Icons.add, color: Colors.green),
                          onPressed: () {
                            // Handle add supplier action
                          },
                        ),
                      ],
                    ),
                    SizedBox(height: 16),

                    // Reference Number
                    TextFormField(
                      decoration: InputDecoration(
                        labelText: "Reference No:",
                        border: OutlineInputBorder(),
                      ),
                    ),
                    SizedBox(height: 16),

                    // Purchase Date
                    TextFormField(
                      readOnly: true,
                      decoration: InputDecoration(
                        labelText: "Purchase Date*",
                        border: OutlineInputBorder(),
                        suffixIcon: IconButton(
                          icon: Icon(Icons.calendar_today),
                          onPressed: () async {
                            DateTime? pickedDate = await showDatePicker(
                              context: context,
                              initialDate: DateTime.now(),
                              firstDate: DateTime(2000),
                              lastDate: DateTime(2101),
                            );
                            if (pickedDate != null) {
                              setState(() {
                                _purchaseDate = pickedDate;
                              });
                            }
                          },
                        ),
                      ),
                      controller: TextEditingController(
                        text: _purchaseDate != null
                            ? "${_purchaseDate!.month}/${_purchaseDate!.day}/${_purchaseDate!.year}"
                            : "",
                      ),
                    ),
                    SizedBox(height: 16),

                    // Purchase Status Dropdown
                    DropdownButtonFormField<String>(
                      decoration: InputDecoration(
                        labelText: "Purchase Status*",
                        border: OutlineInputBorder(),
                      ),
                      value: _purchaseStatus,
                      items: ['Pending', 'Completed', 'Cancelled']
                          .map((status) => DropdownMenuItem(
                                value: status,
                                child: Text(status),
                              ))
                          .toList(),
                      onChanged: (value) {
                        setState(() {
                          _purchaseStatus = value;
                        });
                      },
                    ),
                    SizedBox(height: 16),

                    // Business Location
                    TextFormField(
                      initialValue: "Awesome Shop",
                      readOnly: true,
                      decoration: InputDecoration(
                        labelText: "Business Location*",
                        border: OutlineInputBorder(),
                      ),
                    ),
                    SizedBox(height: 16),

                    // Pay Term
                    TextFormField(
                      decoration: InputDecoration(
                        labelText: "Pay Term:",
                        border: OutlineInputBorder(),
                      ),
                    ),

                    SizedBox(height: 16),

                    // Additional Dropdown at Bottom
                    DropdownButtonFormField<String>(
                      decoration: InputDecoration(
                        labelText: "Please Select",
                        border: OutlineInputBorder(),
                      ),
                      items: ['Option 1', 'Option 2', 'Option 3']
                          .map((option) => DropdownMenuItem(
                                value: option,
                                child: Text(option),
                              ))
                          .toList(),
                      onChanged: (value) {
                        // Handle selection
                      },
                    ),
                    SizedBox(height: 16),

                    // File Upload Section
                    Text(
                      "Attachment",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 8),
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            _fileName ?? "No file selected",
                            style: TextStyle(color: Colors.grey[700]),
                          ),
                        ),
                        IconButton(
                          icon: Icon(Icons.attach_file, color: Colors.blue),
                          onPressed: _pickFile,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
