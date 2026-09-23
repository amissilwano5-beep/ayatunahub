import 'package:shared_preferences/shared_preferences.dart';

class PremiumService {
  static const String _keyPremium = 'is_premium';
  static const String _keyPlan = 'premium_plan';
  static const String _keyTrialEndsAt = 'premium_trial_ends_at';

  static Future<bool> isPremium() async {
    final prefs = await SharedPreferences.getInstance();
    final premium = prefs.getBool(_keyPremium) ?? false;
    if (premium) return true;

    final trialEndsAt = prefs.getInt(_keyTrialEndsAt) ?? 0;
    if (trialEndsAt == 0) return false;

    return DateTime.now().millisecondsSinceEpoch < trialEndsAt;
  }

  static Future<void> setPremium(bool value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(_keyPremium, value);
    if (!value) {
      await prefs.remove(_keyPlan);
    }
  }

  static Future<String> getPlan() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(_keyPlan) ?? 'free';
  }

  static Future<void> setPlan(String plan) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_keyPlan, plan);
    await prefs.setBool(_keyPremium, plan != 'free');
  }

  static Future<void> activateTrial() async {
    final prefs = await SharedPreferences.getInstance();
    final trialEndsAt = DateTime.now().add(const Duration(hours: 32)).millisecondsSinceEpoch;
    await prefs.setInt(_keyTrialEndsAt, trialEndsAt);
    await prefs.setString(_keyPlan, 'trial');
  }

  static Future<void> clearTrial() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_keyTrialEndsAt);
    await prefs.remove(_keyPlan);
    await prefs.setBool(_keyPremium, false);
  }
}
