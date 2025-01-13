import 'package:firebase_auth/firebase_auth.dart';
import 'package:googleapis_auth/auth_io.dart';

String currentUserID = FirebaseAuth.instance.currentUser!.uid;

String fmcServerToken = "";

class GetServerKey {
Future<String>GetServerKeyToken()async
{
  final scopes = [
    'https: //www.googleapis.com/auth/userinfo.email',
    'https: //www.googleapis.com/auth/firebase.database',
    'https: //www.googleapis.com/auth/firebase.messaging',
  ];

  final client = await clientViaServiceAccount(
    ServiceAccountCredentials.fromJson(
      {
  "type": "service_account",
  "project_id": "soulmingle-5d95a",
  "private_key_id": "a3eafe522a8e9e4bb501f52e99093abd8a46e6c7",
  "private_key": "-----BEGIN PRIVATE KEY-----\nMIIEvAIBADANBgkqhkiG9w0BAQEFAASCBKYwggSiAgEAAoIBAQC3+7iJZUxZ/Ldl\nmU0ZvRdwCVHMFCy9kWYwvCvLeV3Di/FmnGWvVSDVPJOF9u/OLLlUDGW0uyvCVEAf\nfi2wNNl7BXIf4+jOQ+Rd4Cm350uTOnliYnbAZjEOrUT9SJ9i4w9X9FOi9OqjkwJ5\n21K7AEUWlnDsDwHKfQIlmRQvm4cguNqo9mZYmrz6eKMKbAyjkkVzqT8tQFUUtqkn\nq01EVksQItIvE0LXWpeCneHjlb8AOM4QnnDyiVEMurmPxPzsYrYgzjKZMBbUTwew\n+adWJkcFVDlftelNBeUq9z875HNJYMmOEPIYq1YQrHIxc/TegwcQv792P2pAxrW8\nh96lFzi1AgMBAAECggEAH8NBHVVD7HAs8EkaTrR+sJynRrp/691HfWfrDqZ+CcWl\n8B9VjcK+V5ns5Q6X4WoGt8wpHd3HZPX7GQTFWfuRxUOQK5HC7iM58HwD78gqW7lX\nXeUeV8J8uyouNCT+wUlua3KWotYyEPnPDl8PJhIam1bvGU3Q8xaIUZnfKoXo+vyr\n7pOa/IV3ZWn+U8yTHz5RGncqFNKehBwXVlXTQRFkvMFwDWiF722H1xvR/0tUJEQ/\nmAWFGXPNveinQ+3YYqB9xFhO8JA2EglrJ1r11rn+32npevgaykPDjhdRXTp0/gnr\nNhELq4byv28URHgglkX8yFMUN0UXSEHFpgYpM/g6aQKBgQDdHMnZd0JAPCBXmF6m\n1goGhWU8X8TUoj8SmfE2Sj4VI8gxF2CwTcSF9914OZcM/HKf2X6kUZkutK37n1we\nVa2yukw2HmL/jZdn25xojFZwxpJxrtVZfSvZuWCsvkF3yfnzCZhWrCEuTxUEkKRW\nTlGwS4NiUKrb5N+GQsHvsDkCvQKBgQDVAzRlAoFv6VTvVS7v9SzIRwoo9ldPFSXn\nD03je1gbLPFNaCqY609jnDcrmmL88I+r0zFDnZMVqajgbltMQlj7qnm+aybQCBfv\nR5XF1FHkDJxNSnIjrwIl9w1vXjUB/dQPmS903IU3bus281ZYvCdtZqqgcOEjr1eU\nCB6oTvkpWQKBgCHuTgdiJreGwovOpQ/DHsy7YbqvE5xxvW4UU5C6OeaylAD8jmjf\ntj28uK6/X6+tecWP8cAziWdCcMSBQvigu0QHFLTlWtnOl6JncAwXJRivUD/DzZeq\n/rStnulDVPaV9xZVrZv3VCwwFJCbxaw83opIPEQ1DtMpvydyTSKED2udAoGAGjke\nxiCc1q4e6qfN83R3YuB7+7b34KB13hAgQpT4r7/EpQbh15mAWH7uu8txzDnBNiH1\nuqE3bj9Irvhm/OheE/1Up4CBcrLMX4Ssh4Iv4qc6xrkXfBUbapkTalZqqCgbZyAw\nm25aaAyboFQsmRfwsqMk9kNvM/luCqdFPusZ+WECgYBbTtEHMJT65dg7DOwqOaC2\njZx5nm8Cp/sVI5L5R8NGujs37C03A/ItbKbovh629VqL8Cv/j2O25/s8cnyS4jJV\nc1w9OTzh3faQZAvg7A2736D7RzKktf8Gu6bcwPGty9cakovnZHhoFmt9IICsJUl7\n7rzTW/kWpOzv5TnCIm5VMA==\n-----END PRIVATE KEY-----\n",
  "client_email": "firebase-adminsdk-rkczh@soulmingle-5d95a.iam.gserviceaccount.com",
  "client_id": "100748387948448334653",
  "auth_uri": "https://accounts.google.com/o/oauth2/auth",
  "token_uri": "https://oauth2.googleapis.com/token",
  "auth_provider_x509_cert_url": "https://www.googleapis.com/oauth2/v1/certs",
  "client_x509_cert_url": "https://www.googleapis.com/robot/v1/metadata/x509/firebase-adminsdk-rkczh%40soulmingle-5d95a.iam.gserviceaccount.com",
  "universe_domain": "googleapis.com"
},
    ),
    scopes,
  );
  final accessServerKey = client.credentials.accessToken.data;
  return "";
}
}
