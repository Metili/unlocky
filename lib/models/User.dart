class User {
  final int? id;
  final String? userId;
  final String? firstName;
  final String? lastName;
  final int? status;
  final String? phone;
  final String? mail;
  final String? password; // Consider handling this more securely in production
  final List<Role>? roles;
  final bool? enabled;
  final List<String>? authorities; // Use nullable type if the property may be missing
  final String? username;
  final bool? phoneVerified;
  final bool? accountNonExpired;
  final bool? accountNonLocked;
  final bool? credentialsNonExpired;

  User({
    this.id,
    this.userId,
    this.firstName,
    this.lastName,
    this.status,
    this.phone,
    this.mail,
    this.password, // Handle securely
    this.roles,
    this.enabled,
    this.authorities,
    this.username,
    this.phoneVerified,
    this.accountNonExpired,
    this.accountNonLocked,
    this.credentialsNonExpired,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json['id'] as int,
        userId: json['userId'] as String,
        firstName: json['firstName'] as String,
        lastName: json['lastName'] as String,
        status: json['status'] as int,
        phone: json['phone'] as String,
        mail: json['mail'] as String,
        password: json['password'] as String, // Handle securely
        roles: (json['roles'] as List)
            .map((role) => Role.fromJson(role as Map<String, dynamic>))
            .toList(),
        enabled: json['enabled'] as bool,
        authorities: json['authorities'] == null ? null : (json['authorities'] as List).map((authority) => authority as String).toList(),
        username: json['username'] as String,
        phoneVerified: json['phoneVerified'] as bool,
        accountNonExpired: json['accountNonExpired'] as bool,
        accountNonLocked: json['accountNonExpired'] as bool,
        credentialsNonExpired: json['credentialsNonExpired'] as bool,
      );
}

class Role {
  final int id;
  final String name;
  final List<String> permissions;
  final List<String> authorities;

  Role({
    required this.id,
    required this.name,
    required this.permissions,
    required this.authorities,
  });

  factory Role.fromJson(Map<String, dynamic> json) => Role(
        id: json['id'] as int,
        name: json['name'] as String,
        permissions: (json['permissions'] as List).map((permission) => permission as String).toList(),
        authorities: (json['authorities'] as List).map((authority) => authority as String).toList(),
      );
}
