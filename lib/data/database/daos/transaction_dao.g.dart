// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transaction_dao.dart';

// ignore_for_file: type=lint
mixin _$TransactionDaoMixin on DatabaseAccessor<AppDatabase> {
  $CurrencyTable get currency => attachedDatabase.currency;
  $LedgerTable get ledger => attachedDatabase.ledger;
  $StakeholderTable get stakeholder => attachedDatabase.stakeholder;
  $TransactionsTable get transactions => attachedDatabase.transactions;
  $AccountTable get account => attachedDatabase.account;
  $TransactionAmountDetailTable get transactionAmountDetail =>
      attachedDatabase.transactionAmountDetail;
  $CategoryTable get category => attachedDatabase.category;
  $TransactionCategoryDetailTable get transactionCategoryDetail =>
      attachedDatabase.transactionCategoryDetail;
  $TransactionInstallmentDetailTable get transactionInstallmentDetail =>
      attachedDatabase.transactionInstallmentDetail;
  $TransactionInstallmentItemTable get transactionInstallmentItem =>
      attachedDatabase.transactionInstallmentItem;
  $TransactionReduceTable get transactionReduce =>
      attachedDatabase.transactionReduce;
  $TransactionRefundTable get transactionRefund =>
      attachedDatabase.transactionRefund;
  $ProjectTable get project => attachedDatabase.project;
  $RelationProjectTransactionTable get relationProjectTransaction =>
      attachedDatabase.relationProjectTransaction;
  $RelationTransactionTable get relationTransaction =>
      attachedDatabase.relationTransaction;
}
