import 'package:flutter/material.dart';
import 'package:food_delivery/modules/dashboard/views/dashboard_view.dart';
import 'package:food_delivery/modules/location_search/views/manual_location_search_view.dart';

class LocationPermissionView extends StatelessWidget {
  const LocationPermissionView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: false,
      extendBodyBehindAppBar: false,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text("What\'s your location?", style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),),
              const SizedBox(height: 10,),
              const Text("We need your location to show available restaurants & products.",
              style: TextStyle(fontSize: 16),
              ),
              const SizedBox(height: 10,),
              const Spacer(),
              ElevatedButton(
        
                  onPressed: (){
                    Navigator.of(context).push(MaterialPageRoute(builder: (context)=>DashboardView()));
                  },
                  style: ElevatedButton.styleFrom(
                      disabledBackgroundColor: Colors.deepOrange.withOpacity(0.3),
                      backgroundColor: Colors.deepOrange,
                      fixedSize: const Size(double.maxFinite, 50),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))
                  ),
        
                  child: const Text("Allow location access", style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),)
              ),
              const SizedBox(height: 10,),
              Center(
                child: InkWell(
                    onTap: (){
Navigator.of(context).push(MaterialPageRoute(builder: (context)=>ManualLocationSearchView()));
                    },
                    child: const Text("Enter Location Manually",
                      style: TextStyle(fontSize: 16, color: Colors.deepOrange, fontWeight: FontWeight.w500),)),
              ),
        
            ],
          ),
        ),
      ),
    );
  }
}
