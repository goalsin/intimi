Intimi.Message = DS.Model.extend
  content: DS.attr('string')
  direction: DS.attr('string', defaultValue: 'out')
  status: DS.attr('string', defaultValue: 'pending')
  createdAt: DS.attr('date')

  conversation: DS.belongsTo('Intimi.Conversation')

  #didCreate: ->
    #number = if isOut
      #@get('receiver.number')
    #else
      #@get('sender.number')

    ## FIXME Create it if not exist
    #contact = Intimi.Contact.find(number: number)

    #contact.set('latestMessage', this)
    #contact.incrementProperty('messagesCount')
    #contact.incrementProperty('notRepliedCount') if isOut and survey

    #contact.save()

  isIn: (->
    @get('direction') == 'in'
  ).property('direction')

  isOut: (->
    @get('direction') == 'out'
  ).property('direction')
