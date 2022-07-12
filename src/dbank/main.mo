import Debug "mo:base/Debug";
import Time "mo:base/Time";
import Float "mo:base/Float";

// DBank is a class and in motoko classes are called as actor
// with this a canister is made 
actor DBank {
  
  stable var currentValue: Float = 100;
  currentValue := 100;

  stable var startTime = Time.now();
  startTime := Time.now();


//  if you want to print a string then Debug.print("String ") can be used but to print a variable in terminal you have to use debug_show as a function
 

  public func topUp(amount: Float){
    currentValue += amount;

  };
  
  public func withdraw(amount:Float){
    let tempVal:Float = currentValue - amount;
    if( tempVal>= 0){
    currentValue -= amount;
    Debug.print(debug_show(currentValue));
    }
    else{
      Debug.print("Number less than 0")
    }
  };

  public query func checkBalance(): async Float {
  return currentValue;
  };
  
  public func compound(){
    let currentTime= Time.now();
    let timeElapsedNS = currentTime - startTime;
    let timeElapsedS = timeElapsedNS/1000000000;
    currentValue := currentValue * (1.01 ** Float.fromInt(timeElapsedS));
    startTime := currentTime;
  }
}