import 'package:flutter/material.dart';

class DoctorScreen extends StatefulWidget {
  const DoctorScreen({super.key});

  @override
  State<DoctorScreen> createState() => _DoctorScreenState();
}

class _DoctorScreenState extends State<DoctorScreen> {
  // 🔹 Dummy doctors
  final List<String> doctors = [
    "Dr. Alice (Cardiologist)",
    "Dr. Bob (Psychiatrist)",
    "Dr. Charlie (Dermatologist)",
    "Dr. David (Physician)",
  ];

  String? selectedDoctor;
  DateTime? selectedDate;
  String? selectedTimeSlot;

  // 🔹 Available time slots
  final List<String> timeSlots = [
    "09:00 AM - 09:30 AM",
    "10:00 AM - 10:30 AM",
    "11:00 AM - 11:30 AM",
    "02:00 PM - 02:30 PM",
    "03:00 PM - 03:30 PM",
    "04:00 PM - 04:30 PM",
  ];

  // 🔹 Booked appointments
  final List<Map<String, String>> bookedAppointments = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Doctor Appointments")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Doctor Selection
              const Text(
                "Select Doctor",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              DropdownButtonFormField<String>(
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "Choose a doctor",
                ),
                value: selectedDoctor,
                items: doctors
                    .map((doc) => DropdownMenuItem(
                          value: doc,
                          child: Text(doc),
                        ))
                    .toList(),
                onChanged: (value) {
                  setState(() {
                    selectedDoctor = value;
                  });
                },
              ),
              const SizedBox(height: 20),

              // Date Picker
              const Text(
                "Select Date",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              ListTile(
                title: Text(
                  selectedDate == null
                      ? "No date chosen"
                      : "${selectedDate!.day}-${selectedDate!.month}-${selectedDate!.year}",
                ),
                trailing: const Icon(Icons.calendar_today),
                onTap: () async {
                  final pickedDate = await showDatePicker(
                    context: context,
                    initialDate: DateTime.now().add(const Duration(days: 1)),
                    firstDate: DateTime.now(),
                    lastDate: DateTime.now().add(const Duration(days: 30)),
                  );
                  if (pickedDate != null) {
                    setState(() {
                      selectedDate = pickedDate;
                    });
                  }
                },
              ),
              const SizedBox(height: 20),

              // Time Slot Selection
              const Text(
                "Select Time Slot",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              Wrap(
                spacing: 10,
                children: timeSlots.map((slot) {
                  final isSelected = slot == selectedTimeSlot;
                  return ChoiceChip(
                    label: Text(slot),
                    selected: isSelected,
                    onSelected: (value) {
                      setState(() {
                        selectedTimeSlot = slot;
                      });
                    },
                  );
                }).toList(),
              ),
              const SizedBox(height: 30),

              // Confirm Button
              Center(
                child: ElevatedButton.icon(
                  icon: const Icon(Icons.check_circle),
                  label: const Text("Confirm Appointment"),
                  style: ElevatedButton.styleFrom(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 30, vertical: 12),
                    textStyle: const TextStyle(fontSize: 18),
                  ),
                  onPressed: () {
                    if (selectedDoctor == null ||
                        selectedDate == null ||
                        selectedTimeSlot == null) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content:
                              Text("Please select doctor, date & time slot."),
                        ),
                      );
                      return;
                    }

                    // Save appointment
                    setState(() {
                      bookedAppointments.add({
                        "doctor": selectedDoctor!,
                        "date":
                            "${selectedDate!.day}-${selectedDate!.month}-${selectedDate!.year}",
                        "time": selectedTimeSlot!,
                      });

                      // Reset selection
                      selectedDoctor = null;
                      selectedDate = null;
                      selectedTimeSlot = null;
                    });

                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text("Appointment booked successfully ✅"),
                      ),
                    );
                  },
                ),
              ),
              const SizedBox(height: 30),

              // Booked Appointments List
              const Text(
                "My Appointments",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              if (bookedAppointments.isEmpty)
                const Text("No appointments booked yet."),
              ...bookedAppointments.map((appointment) => Card(
                    margin: const EdgeInsets.symmetric(vertical: 8),
                    child: ListTile(
                      leading: const Icon(Icons.local_hospital,
                          color: Colors.teal),
                      title: Text(appointment["doctor"]!),
                      subtitle: Text(
                          "${appointment["date"]} • ${appointment["time"]}"),
                    ),
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
