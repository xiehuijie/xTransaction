// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transaction_dao.dart';

// ignore_for_file: type=lint
mixin _$TransactionDaoMixin on DatabaseAccessor<LedgerDatabase> {
  $TransactionsTable get transactions => attachedDatabase.transactions;
  $TransactionMetaTable get transactionMeta => attachedDatabase.transactionMeta;
  $CurrencyTable get currency => attachedDatabase.currency;
  $AccountTable get account => attachedDatabase.account;
  $TransactionAmountDetailTable get transactionAmountDetail =>
      attachedDatabase.transactionAmountDetail;
  $CategoryTable get category => attachedDatabase.category;
  $StakeholderTable get stakeholder => attachedDatabase.stakeholder;
  $ProjectTable get project => attachedDatabase.project;
  $TransactionCountDetailTable get transactionCountDetail =>
      attachedDatabase.transactionCountDetail;
  $TransactionReduceTable get transactionReduce =>
      attachedDatabase.transactionReduce;
  $TransactionRefundTable get transactionRefund =>
      attachedDatabase.transactionRefund;
  $TransactionRelationTable get transactionRelation =>
      attachedDatabase.transactionRelation;
}
