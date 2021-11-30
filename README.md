# 29 November Coding Challenge (Due 6 pm Eastern 1 December)

## Tier I (90 Points)

For this challenge, you'll use the Nov29CodingChallenge Apex class as a template. All three methods within this class (withSecurityEnforcedClause(),stripInaccessibleMethod(), and schemaNamespaceClasses()) will execute a SOQL query that returns the Name, Title, Email, and Phone fields from the Contact sObject as well as the Name of the related Account.

The methods will differ in what they'll do before and/or after this query.

The withSecurityEnforcedClause() method should use the WITH SECURITY_ENFORCED SOQL clause in its query. You should implement exception handling for the case that the running user does not have access to any of the fields and return a null value if this is the case.

stripInaccessibleMethod() will use the Security.stripInaccessible() method to remove any fields that the running user does not have read access to before returning the collection of sanitized records.

The schemaNamespaceClasses() method will check for the running users read access to all fields and objects involved in the query before executing the query. If the running user doesn't have access to a field, it should not be included in the query. If the running user does not have access to the Contact object, the query should not be executed and your method should return a null value.

## Tier II (10 points)

Expand the functionality of your stripInaccessibleMethod() and schemaNamespaceClasses() methods from above.

Change the return type of these methods to an instance of the included Nov29Wrapper class. This class has two member variables, a Set<String> named removedFields and a List<Contact> named sanitizedCons.

stripInaccessibleMethod() and schemaNamespaceClasses() should populate the Nov29Wrapper.removedFields set with a collection of fields that were either removed from the results or excluded from the query in the first place, respectively. The methods should similarly populate the Nov29Wrapper.sanitizedCons list with the sanitized records.
