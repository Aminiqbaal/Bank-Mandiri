CREATE TABLE "m_notification" (
  "notificationId" int NOT NULL,
  "userId" int NOT NULL,
  "message" "char " NOT NULL,
  "sendAt" timestamp NOT NULL,
  "createdAt" timestamp NOT NULL,
  "updateAt" timestamp NOT NULL,
  "deleteAt" timestamp NOT NULL,
  PRIMARY KEY ("notificationId")
);

CREATE TABLE "m_status_loan" (
  "statusLoanId" int NOT NULL,
  "description" "char " NOT NULL,
  "createdAt" timestamp NOT NULL,
  "updateAt" timestamp NOT NULL,
  "deleteAt" timestamp NOT NULL,
  PRIMARY KEY ("statusLoanId")
);

CREATE TABLE "m_user" (
  "userId" int NOT NULL,
  "email" "char " NOT NULL,
  "name" "char " NOT NULL,
  "address" "char " NOT NULL,
  "phoneNumber" int NOT NULL,
  "password" "char " NOT NULL,
  "photo" "char " NOT NULL,
  "ktp" "char " NOT NULL,
  "biometricsId" int NOT NULL,
  "createdAt" timestamp NOT NULL,
  "updateAt" timestamp NOT NULL,
  "deleteAt" timestamp NOT NULL,
  PRIMARY KEY ("userId")
);

CREATE TABLE "t_loan" (
  "loanId" int NOT NULL,
  "userId" int NOT NULL,
  "amount" int NOT NULL,
  "tenure" int NOT NULL,
  "debt" int NOT NULL,
  "statusLoanId" int NOT NULL,
  "paymentAt" timestamp NOT NULL,
  "paidOffAt" timestamp NOT NULL,
  "createdAt" timestamp NOT NULL,
  "updateAt" timestamp NOT NULL,
  PRIMARY KEY ("loanId")
);

CREATE TABLE "biometrics" (
  "biometricsId" int PRIMARY KEY,
  "fingerprint" char,
  "face_data" char
);

ALTER TABLE "t_loan" ADD CONSTRAINT "FK_m_user_TO_t_loan" FOREIGN KEY ("userId") REFERENCES "m_user" ("userId");

ALTER TABLE "t_loan" ADD CONSTRAINT "FK_m_status_loan_TO_t_loan" FOREIGN KEY ("statusLoanId") REFERENCES "m_status_loan" ("statusLoanId");

ALTER TABLE "m_notification" ADD CONSTRAINT "FK_m_user_TO_m_notification" FOREIGN KEY ("userId") REFERENCES "m_user" ("userId");

ALTER TABLE "biometrics" ADD CONSTRAINT "FK_m_user_TO_biometricz" FOREIGN KEY ("biometricsId") REFERENCES "m_user" ("biometricsId");
