## [CAPM] Cloud application programming model

### Starter guide for cloud foundry BTP

</br>
</br>

**BTP Trial Account**

- [x] Read this blog to create SAP Account and BTP account https://developers.sap.com/tutorials/hcp-create-trial-account.html

</br>

**Break down structure of the accouts**

- [x] SAP Account account of the company -- (Tier 1)
- [x] SAP Global account for billing by SAP for BTP (BTP Trial / Business Account) -- (Tier 2)
- [x] Sub Account (Region wise classification ex: Asia sub1, Eur Sub2, NA Sub3....etc for user accounts) -- (Tier 3)

</br>

** Global Account :**

- [x] This Account is associated with the company for billing purposes for SAP on BTP services 
- [x] It contains many sub accounts of different region (different data centers)
- [x] All SAP services allocated here for business purpose to different sub accounts 

</br>

** Sub Account :**

- [x] This contains service entitlements allocated from global account 
- [x] Different sub accoutn will have same or different services allcoated for business needs 
- [x] Users are granted access at this level 
- [x] Instances of services will be availble here and each instance is capable of single or multiple Dev space


</br>

## Environments, Subscriptions, Instances  : 


** 1 Environments :**
   </br>
   </br>
<p> 

Environment is a platform-as-a-service it is set at sub account level it is for development and administartion of applications 
it consists of 3 categories ABAP, Cloud foundry and Kyma.

(Kyma is kubernetees termed differently for SAP BTP)
  
</p>    
   </br>
   </br>
   
