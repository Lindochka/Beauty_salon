-- Creates the master key.
  -- The key is encrypted using the password "23987hxJ#KL95234nl0zBe".  
  CREATE MASTER KEY ENCRYPTION BY PASSWORD = '23987hxJ#KL95234nl0zBe';

  USE master 
GO 
CREATE MASTER KEY ENCRYPTION  
BY PASSWORD = 'Pa$$w0rd'; 
GO 
CREATE CERTIFICATE  Security_Certificate  
WITH SUBJECT = ' DEK_Certificate'; 
GO 

BACKUP CERTIFICATE Security_Certificate  
TO FILE = 'D:\backups\security_certificate.cer' 
WITH PRIVATE KEY 
(FILE = 'D:\backups\security_certificate.key' , 
ENCRYPTION BY PASSWORD = 'CertPa$$w0rd'); 

USE Beauty_salon_2 
GO 
CREATE DATABASE ENCRYPTION KEY  
WITH ALGORITHM = AES_128 
ENCRYPTION BY SERVER CERTIFICATE Security_Certificate 
GO 

ALTER DATABASE Beauty_salon_2 
SET ENCRYPTION ON;

USE master; 
SELECT name, is_encrypted FROM sys.databases ; 